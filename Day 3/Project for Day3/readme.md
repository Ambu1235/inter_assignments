# Day 3 – FIFO-Based Data Buffering and FSM-Controlled Output System

## Overview

This project focuses on the design and verification of a **FIFO-Based Data Buffering System** using **Verilog HDL**. The system consists of three interconnected modules: an **Input Module**, a **FIFO Buffer**, and an **FSM-Based Output Module**. The design was implemented and simulated using **Xilinx Vivado** to verify correct data transfer, buffering, and delayed output generation.

The FIFO serves as a temporary storage element between the producer and consumer modules, while the output module utilizes a Finite State Machine (FSM) to introduce a controlled processing delay before generating the final output.

## Objective

* Design a FIFO-based buffering system using Verilog HDL.
* Implement data transfer through multiple interconnected modules.
* Introduce controlled output delay using an FSM-based architecture.
* Verify correct FIFO operation through simulation and waveform analysis.
* Validate system functionality using Xilinx Vivado.

## Introduction

Modern digital systems frequently require temporary data storage between different processing stages. A First-In-First-Out (FIFO) memory structure provides an efficient mechanism for buffering data while maintaining the order of arrival.

In this project, incoming data is first captured by an Input Module and written into a FIFO memory. The stored data is later retrieved by an FSM-controlled Output Module after a predefined delay of three clock cycles.

This architecture resembles real-world processing pipelines such as image acquisition systems, where captured data is temporarily stored before undergoing further processing.

## Applications

FIFO-based buffering systems are widely used in:

* Image Processing Pipelines
* Video Streaming Systems
* Communication Interfaces
* Data Acquisition Systems
* Embedded Hardware Platforms
* FPGA-Based Processing Architectures
* Digital Signal Processing Systems
* Real-Time Control Systems

## Theory

### Input Module

The Input Module captures incoming serial data synchronized with the system clock and forwards the processed data stream to the FIFO buffer.

#### Inputs

* Clock (clk)
* Serial Input (sin)

#### Output

* Serial Output (sout)

---

### FIFO Buffer

FIFO stands for **First-In-First-Out**, meaning the first data written into memory is the first data retrieved.

The FIFO consists of:

* Memory Array
* Write Pointer
* Read Pointer
* Full Flag
* Empty Flag

#### FIFO Characteristics

* Sequential Data Storage
* Ordered Data Retrieval
* Temporary Data Buffering
* Independent Read and Write Operations

---

### FSM-Based Output Module

The Output Module is implemented using a Finite State Machine (FSM).

The FSM introduces a fixed delay of three clock cycles before data is processed and forwarded to the output.

#### Inputs

* Clock (clk)
* Data Input (din)

#### Output

* Data Output (dout)

## Operating Principle

The overall data flow is illustrated below:

```text
sin → Input Module → FIFO → Output FSM → dout
```

### Step 1: Data Capture

The Input Module samples the incoming serial data and forwards it to the FIFO.

### Step 2: FIFO Storage

The FIFO stores incoming data in memory locations pointed to by the Write Pointer.

### Step 3: Delay Generation

The FSM waits for three clock cycles before initiating data retrieval.

### Step 4: Data Retrieval

Stored data is read from the FIFO using the Read Pointer.

### Step 5: Output Generation

The FSM processes the retrieved data and drives the final output.

## Design Methodology

The design was developed using a modular hierarchical structure.

### Module 1: Input Module

Responsible for capturing and forwarding incoming serial data.

#### Inputs

* clk
* sin

#### Output

* sout

---

### Module 2: FIFO Buffer

Responsible for temporary data storage.

#### Inputs

* clk
* rst
* wrenb
* rdenb
* data_in

#### Outputs

* data_out
* full
* empty

---

### Module 3: FSM-Based Output Module

Responsible for delayed data processing and output generation.

#### Inputs

* clk
* din

#### Output

* dout

## Design Features

* Modular Verilog Implementation
* FIFO-Based Data Buffering
* FSM-Controlled Output Processing
* Three Clock Cycle Delay Mechanism
* Sequential Data Flow
* Hierarchical Design Methodology
* RTL Synthesis Compatibility
* Simulation-Based Verification

## RTL Analysis

The RTL schematic generated in Vivado verifies the implementation and includes:

* Input Data Capture Logic
* FIFO Memory Structure
* Read and Write Pointer Logic
* Full and Empty Status Detection
* FSM State Transition Logic
* Delayed Output Generation Circuitry

The synthesized RTL structure accurately reflects the intended buffering and control architecture.

<img width="1065" height="297" alt="image" src="https://github.com/user-attachments/assets/67ba7cb9-9385-4937-bab0-29579fc57484" />


## RTL Synthesis

The design was successfully synthesized using Xilinx Vivado. The synthesis process translated the Verilog HDL description into a hardware implementation consisting of interconnected logic elements, memory resources, and finite state machine control circuitry.

The synthesized design includes:

* Input Data Capture Logic
* FIFO Memory Array
* Read Pointer Logic
* Write Pointer Logic
* Full and Empty Flag Generation
* FSM State Transition Logic
* Delay Counter Circuitry
* Output Generation Logic

The synthesis results confirmed that all modules were correctly interconnected and functionally mapped to FPGA resources.

### Synthesized Architecture

```text
Input Module
      │
      ▼
   FIFO Buffer
      │
      ▼
 Output FSM
      │
      ▼
    Output
```

The synthesized netlist accurately reflects the hierarchical structure of the original Verilog design.

## Resource Utilization

The synthesized design utilizes FPGA resources for:

* Lookup Tables (LUTs)
* Flip-Flops (FFs)
* FIFO Storage Elements
* FSM State Registers
* Routing Resources

The overall resource utilization remained low due to the compact size of the FIFO and FSM implementation, making the design suitable for FPGA-based embedded systems and educational applications.

## Synthesis Verification

The synthesis process verified:

* Correct FIFO memory implementation
* Proper read/write pointer operation
* Accurate full and empty flag generation
* Correct FSM state transitions
* Successful implementation of the three-clock-cycle delay mechanism
* Proper output generation logic

No synthesis errors were observed, and the generated RTL structure matched the intended system architecture.

## RTL Schematic Observation

The RTL schematic generated by Vivado shows:

* Input signal capture circuitry
* FIFO memory block
* Read and write control logic
* State machine control circuitry
* Delay counter implementation
* Output generation logic

The schematic confirms the correct hierarchical interconnection of all modules and validates the overall system architecture.

<img width="582" height="437" alt="image" src="https://github.com/user-attachments/assets/a45d586e-b132-4da3-988a-163201709aff" />



## Verilog Implementation

The project was coded in Verilog HDL using a hierarchical design approach.

### Modules Used

* Input Module
* FIFO Module
* Output FSM Module

The complete system was constructed by interconnecting the three modules through internal signals and control logic.

## Simulation and Verification

A dedicated testbench was developed to verify the functionality of the design.

### Test Scenario

The simulation was performed by applying a serial input sequence to the Input Module.

The following operations were observed:

1. Data captured by Input Module.
2. Data written into FIFO.
3. FSM delay of three clock cycles.
4. Data read from FIFO.
5. Output generated successfully.

### Expected Result

```text
Input Data → FIFO Storage → 3 Clock Cycle Delay → Output Data
```

Data should appear at the output after the specified delay while maintaining FIFO ordering.

### Observed Result

* Data successfully entered FIFO memory.
* Write and Read pointers operated correctly.
* FIFO maintained First-In-First-Out behavior.
* FSM generated the required delay.
* Output data appeared after the delay period.
* No data corruption was observed.

### Result

✅ PASS


<img width="863" height="198" alt="WhatsApp Image 2026-06-10 at 9 10 30 PM" src="https://github.com/user-attachments/assets/90df300d-e69b-4ddf-ad45-f2f00b046a88" 
/>

<img width="863" height="189" alt="WhatsApp Image 2026-06-10 at 9 10 12 PM" src="https://github.com/user-attachments/assets/5e82769f-bc41-4041-b01f-9b4e3895ad57" />




## Observations

* Input data was captured correctly.
* FIFO stored and retrieved data in the correct order.
* Read and Write Pointer operations were verified.
* Full and Empty flags behaved as expected.
* FSM delay mechanism operated correctly.
* Output generation matched design expectations.
* Simulation waveforms confirmed correct system operation.
* RTL synthesis verified proper hardware implementation.

## Conclusion

The FIFO-Based Data Buffering and FSM-Controlled Output System was successfully designed, implemented, and verified using Verilog HDL in Xilinx Vivado. The system accurately demonstrated data buffering, controlled delay generation, FIFO memory management, and FSM-based output processing. Functional simulation and RTL analysis validated the correctness of the design and provided practical experience in hierarchical digital system design, memory buffering techniques, and finite state machine implementation.

