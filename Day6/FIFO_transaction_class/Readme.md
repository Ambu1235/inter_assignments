# Day 6 – Task 1: Development of a FIFO Transaction Class Using SystemVerilog

## Aim

To design a SystemVerilog transaction class capable of generating constrained-random FIFO transactions. This exercise introduces class-based verification concepts and establishes the groundwork for a reusable verification framework.

---

## Overview

Transaction-based verification is a widely adopted methodology in modern digital design verification. Rather than manipulating individual DUT signals directly, related signals are grouped into a single transaction object that represents a complete verification packet.

For FIFO verification, the transaction object encapsulates all control, data, and status signals required to stimulate and observe the DUT. By combining these signals into a class, the testbench becomes more modular, maintainable, and scalable.

---

## Background

### Transaction Objects

A transaction can be viewed as a container that holds all information associated with a single verification operation.

In the FIFO verification environment, the transaction object includes:

* Reset control
* Write control
* Read control
* Input data
* Output data
* FIFO full indication
* FIFO empty indication

Managing these signals through a single object simplifies communication among verification components.

---

### Constrained Random Verification

SystemVerilog provides built-in support for random stimulus generation through the `rand` keyword. Randomization enables the creation of numerous test scenarios without manually specifying each test vector.

#### Benefits

* Improves functional coverage
* Generates diverse test conditions
* Reduces test development time
* Increases the likelihood of detecting corner-case issues

---

## Constraint Implementation

To produce realistic FIFO activity, weighted distribution constraints are applied to selected variables.

### Reset Behavior

```systemverilog
rst_tb dist {0:=8, 1:=2};
```

Distribution:

* Reset deasserted → 80%
* Reset asserted → 20%

This ensures that normal operation occurs more frequently than reset conditions.

---

### Write Enable Behavior

```systemverilog
wrenb_tb dist {0:=2, 1:=8};
```

Distribution:

* Write disabled → 20%
* Write enabled → 80%

This increases the frequency of write operations and helps populate the FIFO.

---

### Read Enable Behavior

```systemverilog
rdenb_tb dist {0:=8, 1:=2};
```

Distribution:

* Read disabled → 80%
* Read enabled → 20%

The lower read probability allows FIFO occupancy levels to vary during simulation.

---

### Input Data Selection

```systemverilog
data_in_tb dist {
    8'hFF := 10,
    8'hAA := 5,
    8'h55 := 5
};
```

| Data Pattern | Weight |
| ------------ | ------ |
| 8'hFF        | 10     |
| 8'hAA        | 5      |
| 8'h55        | 5      |

Among the specified values, `8'hFF` is generated most often, making it a dominant test pattern during simulation.

---

## Class Components

### Randomized Fields

```systemverilog
rand bit rst_tb;
rand bit wrenb_tb;
rand bit rdenb_tb;
rand bit [7:0] data_in_tb;
```

These members participate in constraint-based randomization and are used to generate FIFO stimulus.

---

### Response Fields

```systemverilog
bit [7:0] data_out_tb;
bit full;
bit empty;
```

These variables capture and store the outputs produced by the DUT.

---

### Transaction Display Utility

A display routine is implemented within the class to print transaction details during simulation.

```systemverilog
function void display();
```

The method provides visibility into generated transactions and simplifies debugging activities.

---

## Key Characteristics

* Class-based verification structure
* Support for constrained random stimulus generation
* Encapsulation of FIFO input and output signals
* Built-in transaction reporting capability
* Reusable across multiple verification components
* Scalable foundation for larger verification environments

---

## Importance in Verification

The transaction class acts as the primary communication object throughout the verification environment.

Future verification blocks such as:

* Generator
* Driver
* Monitor
* Scoreboard
* Environment

will exchange transaction objects instead of individual signals, improving abstraction and reducing code complexity.

---

## Results and Observations

* A reusable transaction model for FIFO verification was successfully developed.
* Random stimulus generation was implemented using the `rand` mechanism.
* Constraints controlled the occurrence of reset, read, write, and data values.
* Weighted distributions produced meaningful and realistic FIFO traffic patterns.
* The display method enabled straightforward monitoring of simulation activity.

---

## Summary

A transaction class was developed to represent FIFO operations in a structured and reusable manner. Through constrained-random stimulus generation, the class enables realistic verification scenarios while promoting modular and scalable testbench development. This implementation serves as a fundamental building block for constructing a complete SystemVerilog verification environment.

---

## Software and Tools

* SystemVerilog
* Vivado Simulator

---

## Topics Covered

* SystemVerilog Classes
* Transaction Modeling
* Constrained Random Verification
* Random Variables
* Distribution Constraints
* Object-Oriented Verification
* FIFO Verification Techniques
* Transaction-Based Methodology
