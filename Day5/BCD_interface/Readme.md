# Day 5 – Task 1: Verification of a BCD Adder Using a SystemVerilog Interface

## Overview

This project focuses on the verification of a **Binary Coded Decimal (BCD) Adder** using a **SystemVerilog Interface-based testbench**. The original BCD Adder design was reused, while the verification environment was enhanced by introducing an interface to manage communication between the Design Under Test (DUT) and the testbench.

The purpose of this exercise was to explore modern verification techniques and demonstrate how interfaces improve code organization, readability, and scalability compared to traditional signal-by-signal connections.

---

## Objective

* Verify the functionality of a BCD Adder using a SystemVerilog Interface.
* Simplify DUT and testbench connectivity.
* Validate correct BCD arithmetic operations.
* Observe simulation results through waveform analysis.
* Understand the advantages of interface-driven verification.

---

## Introduction

As digital systems become more complex, connecting every DUT signal individually can make verification environments difficult to manage. Traditional Verilog testbenches often require numerous manual signal connections, increasing the likelihood of errors and reducing maintainability.

SystemVerilog addresses this challenge through **Interfaces**, which allow multiple related signals to be grouped together within a single construct. This approach creates cleaner verification environments and promotes reusable testbench development.

In this task, the previously designed BCD Adder was verified using an interface-based methodology without modifying the original design.

---

## Theory

### Binary Coded Decimal (BCD) Adder

A BCD Adder performs addition on decimal digits represented in Binary Coded Decimal format.

Whenever the intermediate binary sum exceeds the valid BCD range (decimal 9), a correction value of:

```text id="mlrr9o"
0110
```

is added to produce a valid BCD result.

This ensures that the output remains compliant with BCD representation.

---

### SystemVerilog Interface

An Interface is a collection of signals encapsulated into a single reusable communication structure.

Instead of connecting signals individually:

```text id="knd6a8"
a
b
cin
sum
carry
```

all signals are grouped together inside an interface definition.

### Benefits of Using Interfaces

* Reduced connection complexity
* Improved readability
* Easier maintenance
* Better scalability
* Enhanced code reusability
* Support for advanced verification methodologies

---

## BCD Adder Signal Description

### Input Signals

| Signal | Description        |
| ------ | ------------------ |
| a[3:0] | First BCD Operand  |
| b[3:0] | Second BCD Operand |
| cin    | Carry Input        |

### Output Signals

| Signal   | Description    |
| -------- | -------------- |
| sum[3:0] | BCD Sum Output |
| carry    | Carry Output   |

---

## Interface Structure

The interface contains all signals required for communication between the DUT and testbench.

### Signals Included

| Signal   | Function     |
| -------- | ------------ |
| a[3:0]   | Operand A    |
| b[3:0]   | Operand B    |
| cin      | Carry Input  |
| sum[3:0] | Sum Output   |
| carry    | Carry Output |

### Example Interface Declaration

```systemverilog
interface bcd_if;

logic [3:0] a;
logic [3:0] b;
logic cin;

logic [3:0] sum;
logic carry;

endinterface
```

---

## Verification Architecture

The verification environment consists of the following components:

### Interface Layer

Provides a centralized communication channel for all DUT signals.

### BCD Adder DUT

The BCD Adder designed and verified previously.

### Testbench

Generates input stimulus through the interface and monitors DUT responses.

### Verification Flow

```text id="9j0g6j"
Testbench
    │
    ▼
SystemVerilog Interface
    │
    ▼
BCD Adder DUT
    │
    ▼
Result Monitoring
```

---

## RTL Analysis

The RTL architecture remains unchanged because only the verification methodology was modified.

The synthesized BCD Adder still consists of:

* Ripple Carry Adder Stage
* BCD Error Detection Logic
* Correction Circuitry
* Final BCD Addition Stage

The generated RTL schematic confirms that the interface does not affect the synthesized hardware implementation.

### RTL Schematic

*(Insert RTL Schematic Screenshot Here)*

---

## Implementation Details

The BCD Adder was connected to the verification environment using a SystemVerilog Interface.

### Key Features

* Interface-Based DUT Connectivity
* Simplified Signal Management
* BCD Arithmetic Verification
* Functional Simulation Support
* Improved Verification Readability
* Reusable Verification Structure

---

## Functional Verification

A SystemVerilog testbench was developed to verify BCD addition operations.

### Test Case 1

| Parameter | Value |
| --------- | ----- |
| A         | 4     |
| B         | 3     |
| Cin       | 0     |

#### Expected Calculation

```text id="t7czrk"
4 + 3 = 7
```

#### Observed Output

| Signal | Value |
| ------ | ----- |
| Sum    | 7     |
| Carry  | 0     |

Result: ✅ PASS

---

### Test Case 2

| Parameter | Value |
| --------- | ----- |
| A         | 5     |
| B         | 6     |
| Cin       | 0     |

#### Expected Calculation

```text id="e3vjuw"
5 + 6 = 11
```

BCD Representation:

```text id="5r5l9e"
0001 0001
```

#### Observed Output

| Signal | Value |
| ------ | ----- |
| Sum    | 1     |
| Carry  | 1     |

Result: ✅ PASS

---

## Simulation Results

The simulation waveform verified correct operation of the BCD Adder under multiple test conditions.

### Test Scenario 1

| A | B | Sum | Carry |
| - | - | --- | ----- |
| 4 | 3 | 7   | 0     |

### Test Scenario 2

| A | B | Sum | Carry |
| - | - | --- | ----- |
| 5 | 6 | 1   | 1     |

The generated outputs matched the expected BCD arithmetic results.

### Simulation Waveform

*(Insert Simulation Waveform Screenshot Here)*

---

## Comparison: Traditional vs Interface-Based Verification

| Conventional Verification   | Interface-Based Verification |
| --------------------------- | ---------------------------- |
| Separate signal connections | Single interface connection  |
| Higher wiring overhead      | Reduced wiring overhead      |
| More difficult to maintain  | Easier to maintain           |
| Limited scalability         | Highly scalable              |
| Less reusable               | More reusable                |

---

<img width="1240" height="227" alt="image" src="https://github.com/user-attachments/assets/565e4cc0-300e-4cf8-9292-6a65585c8ae9" />


## Observations

* The interface successfully grouped all DUT signals into a single communication structure.
* Signal management became significantly simpler.
* The original BCD Adder functionality remained unchanged.
* Simulation outputs matched expected arithmetic calculations.
* Verification code became more organized and maintainable.
* Interface-based connectivity reduced overall testbench complexity.

---

## Conclusion

The BCD Adder was successfully verified using a **SystemVerilog Interface-based verification environment**. The use of interfaces simplified signal connectivity and improved the overall structure of the testbench without affecting DUT functionality. Functional simulation confirmed correct BCD addition behavior for all applied test cases. This task provided valuable experience in interface-driven verification and demonstrated the practical benefits of SystemVerilog interfaces in modern digital design verification.

---

## Software and Tools

* Xilinx Vivado
* Verilog HDL
* SystemVerilog

---

## Key Concepts Explored

* Binary Coded Decimal Arithmetic
* BCD Adder Verification
* SystemVerilog Interfaces
* DUT-Testbench Communication
* Functional Simulation
* RTL Analysis
* Interface-Based Verification
* Modern Verification Practices
