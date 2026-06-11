# Day 4 – Task 1: Block Memory Generator (Single-Port RAM)

## Overview

This project focuses on the design and verification of an **8-bit Single-Port RAM** using **Verilog HDL**. The memory module was implemented and simulated in **Xilinx Vivado** to validate its read and write functionality.

Random Access Memory (RAM) is a fundamental storage element in digital systems, enabling data to be stored and accessed through specific memory addresses. The implemented design supports independent read and write addressing, making it suitable for a wide range of FPGA and embedded system applications.

---

## Objective

* Design an 8-bit Single-Port RAM using Verilog HDL.
* Implement memory storage and retrieval operations.
* Verify read and write functionality through simulation.
* Analyze the synthesized RTL structure using Xilinx Vivado.

---

## Introduction

Random Access Memory (RAM) is a temporary storage device that allows data to be written to and read from specific memory locations using address signals. Unlike sequential storage devices, RAM provides direct access to any memory location, enabling efficient data storage and retrieval.

A Single-Port RAM utilizes a single communication interface for both read and write operations. The operation performed depends on the control signals and address inputs provided to the memory module.

---

## Applications

Single-Port RAM is widely used in:

* Embedded Systems
* FPGA-Based Designs
* Microcontrollers
* Digital Signal Processing (DSP)
* Data Buffering Applications
* Memory Storage Systems
* Communication Interfaces
* Digital Control Systems

---

## Theory

### Single-Port RAM

A Single-Port RAM consists of a memory array, address selection logic, write control circuitry, and output data registers.

The memory locations are selected using address inputs, while data storage and retrieval are controlled through dedicated read and write mechanisms.

### Inputs

| Signal         | Description                   |
| -------------- | ----------------------------- |
| clk            | Clock Signal                  |
| arstn          | Active-Low Asynchronous Reset |
| wrenb          | Write Enable                  |
| wraddress[7:0] | Write Address                 |
| rdaddress[7:0] | Read Address                  |
| d_in[7:0]      | Input Data                    |

### Output

| Signal        | Description |
| ------------- | ----------- |
| data_out[7:0] | Output Data |

---

## Memory Organization

| Parameter     | Value           |
| ------------- | --------------- |
| Data Width    | 8 Bits          |
| Address Width | 8 Bits          |
| Memory Depth  | 256 Locations   |
| Memory Type   | Single-Port RAM |

The memory can store 256 independent locations, each capable of holding an 8-bit data value.

---

## Working Principle

The RAM operates in two primary modes: **Write Mode** and **Read Mode**.

### Write Operation

When the write enable signal is asserted:

```text
wrenb = 1
```

The input data is written into the memory location specified by the write address.

```text
Memory[wraddress] ← d_in
```

### Read Operation

When a read address is applied, the contents of the selected memory location are retrieved and presented at the output.

```text
data_out ← Memory[rdaddress]
```

The output reflects the data currently stored at the addressed location.

---

## Design Methodology

The RAM architecture was implemented using the following functional blocks:

* Memory Register Array
* Write Control Logic
* Address Decoding Logic
* Read Selection Logic
* Output Register
* Asynchronous Reset Circuitry

### Functional Blocks

#### Memory Array

Stores data values at addressable memory locations.

#### Write Address Decoder

Selects the target memory location during write operations.

#### Read Address Selection Logic

Retrieves data from the specified memory location.

#### Output Register

Provides stable output data during read operations.

#### Reset Logic

Initializes memory contents and output signals during reset.

---

## RTL Analysis

The RTL schematic generated in Vivado verifies the internal memory architecture and control circuitry.

The RTL structure includes:

* Memory register array representing RAM locations
* Address decoding circuitry
* Write control logic
* Read data multiplexing logic
* Output register circuitry
* Reset initialization logic

The synthesized RTL schematic confirms the correct implementation of a Single-Port RAM with independent read and write addressing capabilities.

---

## RTL Synthesis

The design was successfully synthesized using Xilinx Vivado.

The synthesis process generated hardware resources corresponding to:

* Memory Storage Elements
* Address Decoding Logic
* Read Selection Logic
* Write Enable Control Circuitry
* Output Register Logic
* Reset Control Circuitry

The synthesized netlist accurately reflects the intended memory architecture and confirms successful hardware implementation.

---

<img width="915" height="630" alt="image" src="https://github.com/user-attachments/assets/48881285-e5b1-4119-8616-e7b6f6b34e30" />


## Verilog Implementation

The design was implemented using Verilog HDL.

### Design Features

* 8-Bit Data Storage
* 256 Addressable Memory Locations
* Independent Read and Write Addresses
* Write Enable Control
* Active-Low Asynchronous Reset
* Registered Output
* FPGA Synthesis Compatible Design

---

## Simulation and Verification

A dedicated Verilog testbench was developed to validate memory functionality.

### Test Case 1 – Write Operation

| Write Address | Data Written |
| ------------- | ------------ |
| 01            | 55           |
| 02            | AA           |

#### Expected Result

```text
Memory[01] = 55
Memory[02] = AA
```

#### Result

✅ PASS

---

### Test Case 2 – Read Operation

| Read Address | Expected Output |
| ------------ | --------------- |
| 01           | 55              |
| 02           | AA              |

#### Observed Output

| Address | Data Out |
| ------- | -------- |
| 01      | 55       |
| 02      | AA       |

#### Result

✅ PASS

---

### Test Case 3 – Additional Memory Access

| Address | Data |
| ------- | ---- |
| 02      | F0   |

The memory correctly updated and returned the newly stored value.

#### Result

✅ PASS

---

## Simulation Observations

The simulation waveform confirms that:

* Reset properly initializes the memory system.
* Data is successfully written when the write enable signal is asserted.
* Different addresses store independent data values.
* Read operations correctly retrieve stored data.
* Address changes produce the expected output values.
* Memory contents remain unchanged until overwritten.

---

## Sample Memory Transactions

| Address | Data Stored |
| ------- | ----------- |
| 01      | 55          |
| 02      | AA          |
| 02      | F0          |

The output data accurately matched the contents stored in the addressed memory locations.

---

<img width="1289" height="249" alt="image" src="https://github.com/user-attachments/assets/88414107-f7bb-417f-9cf4-18e0cd287531" />


## Observations

* Data was successfully written to the intended memory locations.
* Read operations returned the correct stored values.
* Address decoding operated correctly.
* Memory contents remained stable after storage.
* Reset functionality initialized the system as expected.
* Simulation results matched theoretical RAM behavior.
* RTL analysis confirmed the correct memory architecture.

---

## Conclusion

The **8-bit Single-Port RAM** was successfully designed, implemented, and verified using Verilog HDL in Xilinx Vivado. The memory correctly performed write and read operations based on the supplied addresses and control signals. Functional simulation and RTL synthesis validated the correctness of the design. This task provided practical experience in memory design, address decoding, read/write control logic, and FPGA-based hardware verification.

