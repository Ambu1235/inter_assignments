# Verilog HDL Internship Portfolio

## Overview

This repository serves as a comprehensive record of the projects and assignments completed during the **15-Day Verilog HDL Internship Program** organized by the Department of Electronics and Communication Engineering at **TKM College of Engineering**.

The portfolio showcases practical experience in digital hardware design, simulation, and functional verification using **Verilog HDL** and the **Xilinx Vivado Design Suite**. It includes implementations of both combinational and sequential circuits along with their corresponding testbenches, simulation results, and waveform analyses.

Through these assignments, various concepts of digital system design were explored, ranging from basic arithmetic circuits to sequential storage elements and register architectures.

---

## Intern Details

**Name:** Prayag V T

**Program:** B.Tech in Electronics and Communication Engineering

**Institution:** TKM College of Engineering

**Development Environment:** Xilinx Vivado Design Suite

**Hardware Description Language:** Verilog HDL

---

## Internship Duration

**Start Date:** June 08, 2026

The internship was designed to provide hands-on exposure to digital circuit design methodologies, hardware modeling techniques, and simulation-based verification practices. Each day focused on a specific topic, gradually building a strong foundation in RTL design using Verilog HDL.

---

## Project Summary

### Day 1 – Combinational Logic Design

The initial phase of the internship focused on the implementation and verification of combinational circuits.

#### 4-Bit Ripple Carry Adder (RCA)

A modular 4-bit Ripple Carry Adder was designed to perform binary addition. The project emphasized hierarchical design principles and demonstrated carry propagation through cascaded full-adder stages.

#### BCD Counter

A Binary-Coded Decimal (BCD) Counter was developed and simulated to validate proper counting behavior from 0 to 9. The design was tested under multiple operating conditions to ensure reliable decade-count operation.

---

### Day 2 – Sequential Logic and Storage Elements

The second phase introduced sequential circuit concepts and state-dependent hardware design.

#### Decoder

A behavioral model of a decoder was implemented and verified to study digital code conversion and signal selection mechanisms.

#### Universal Shift Register (USR)

A Universal Shift Register supporting multiple operating modes was developed. The design included:

* Serial-In Serial-Out (SISO)
* Serial-In Parallel-Out (SIPO)
* Parallel-In Serial-Out (PISO)
* Parallel-In Parallel-Out (PIPO)

Simulation results confirmed correct functionality across all operating modes.

#### SR Flip-Flop

An SR Flip-Flop was modeled and verified to understand basic memory elements, state transitions, and latch behavior.

#### D Flip-Flop

A D Flip-Flop was designed and simulated to analyze edge-triggered data storage and synchronous operation.

---

## Repository Structure

```text
inter_assignments/
├── README.md
├── day1/
│   ├── Ripple_Carry_Adder/
│   │   ├── Design/
│   │   └── Test/
│   └── BCD_Counter/
│       ├── Design/
│       └── Test/
│
└── day2/
    ├── Decoder/
    │   ├── Design/
    │   └── Test/
    ├── Universal_Shift_Register/
    │   ├── Design/
    │   └── Test/
    ├── SR_FlipFlop/
    │   ├── Design/
    │   └── Test/
    └── D_FlipFlop/
        ├── Design/
        └── Test/
```


## Complete VLSI CYCLE

┌─────────────┐
│ Specification│
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  RTL Design │ ◄── Verilog/SystemVerilog
└──────┬─────┘
       │
       ▼
┌─────────────┐
│ Simulation  │ ◄── ModelSim/VCS
└──────┬──────┘
       │
       ▼
┌─────────────┐
│ Synthesis   │ ◄── Design Compiler/Vivado
└──────┬──────┘
       │
       ▼
┌──────────────────┐
│ Physical Design  │ ◄── Place & Route
└──────┬───────────┘
       │
       ▼
┌─────────────┐
│Verification │ ◄── STA, LVS, DRC
└──────┬──────┘
       │
       ▼
┌─────────────┐
│  Tapeout    │
└─────────────┘

---

## Skills Developed

Throughout the internship, the following technical skills were strengthened:

* Verilog HDL Coding
* RTL Design Methodology
* Combinational Circuit Design
* Sequential Circuit Design
* Register and Counter Design
* Flip-Flop Modeling
* Testbench Development
* Functional Simulation
* Waveform Analysis
* Hardware Verification Techniques
* Xilinx Vivado Tool Flow

---

## Conclusion

This internship provided valuable hands-on experience in designing and verifying digital systems using Verilog HDL. The projects completed during the program strengthened practical understanding of RTL development, simulation workflows, and verification methodologies, forming a solid foundation for advanced topics in digital design and VLSI engineering.
