# Day 7 – APB Slave Verification Using SystemVerilog

## Overview

This project implements a layered **SystemVerilog verification environment** for an **APB (Advanced Peripheral Bus) Slave**. The verification environment validates APB read and write operations using transaction-based verification techniques, including a generator, driver, monitor, scoreboard, and mailbox-based communication.

The objective is to verify correct functionality of an APB-compliant slave by generating transactions, driving them to the DUT, monitoring bus activity, and comparing DUT responses against a reference model.

---

## Verification Architecture

```
                   +-------------+
                   |    TEST     |
                   +-------------+
                          |
                          v
                   +-------------+
                   | ENVIRONMENT |
                   +-------------+
                    |    |    |
                    |    |    |
                    v    v    v

              +------+ +------+ +------+
              | GEN  | | DRV  | | MON  |
              +------+ +------+ +------+
                  |       |        |
                  |       |        |
                  v       v        v

               gen2drv   APB IF  mon2scb
                  |       |        |
                  +-------+--------+
                          |
                          v

                     +---------+
                     | APB DUT |
                     +---------+
                          |
                          v

                     +---------+
                     |SCOREBOARD|
                     +---------+
```

---

# Components

## 1. APB Interface

The APB interface encapsulates all protocol signals into a single communication channel, simplifying connectivity between the DUT and verification components.

### Signals

* PCLK
* PRESETn
* PSEL
* PENABLE
* PWRITE
* PADDR
* PWDATA
* PRDATA
* PREADY
* PSLVERR

### Purpose

* Simplifies DUT connectivity
* Improves readability
* Encourages reusable verification components

---

## 2. Transaction Class

The transaction class models a single APB transfer.

### Random Fields

| Variable | Description        |
| -------- | ------------------ |
| addr     | APB Address        |
| wdata    | Write Data         |
| write    | Read/Write Control |

### Non-Random Fields

| Variable | Description |
| -------- | ----------- |
| rdata    | Read Data   |

### Example Transactions

**Write**

```
Address : 0x25
Write   : 1
Data    : 0x12345678
```

**Read**

```
Address : 0x25
Write   : 0
```

---

## 3. Generator

The generator creates randomized APB transactions and sends them to the driver through a mailbox.

### Operation

For each iteration:

1. Generate a write transaction.
2. Generate a read transaction for the same address.
3. Send both transactions to the driver.

Example:

```
WRITE  Addr = 25  Data = 12345678
READ   Addr = 25
```

This ensures immediate verification of every write operation.

---

## 4. Driver

The driver converts transactions into APB protocol signal activity.

### APB Write Sequence

**Setup Phase**

```
PSEL    = 1
PENABLE = 0
```

**Access Phase**

```
PSEL    = 1
PENABLE = 1
```

Wait until:

```
PREADY = 1
```

### Driver Flow

```
Transaction
     |
     v
Setup Phase
     |
     v
Access Phase
     |
     v
Wait for PREADY
     |
     v
Transfer Complete
```

---

## 5. Monitor

The monitor passively observes the APB bus and reconstructs completed transactions.

### Capture Condition

```
PSEL    = 1
PENABLE = 1
PREADY  = 1
```

Captured information:

* Address
* Transfer type
* Write data
* Read data

The transaction is forwarded to the scoreboard for checking.

---

## 6. Scoreboard

The scoreboard serves as the reference model.

### Reference Memory

```
ref_mem[256]
```

### Write Operation

```
ref_mem[address] = data;
```

### Read Verification

```
Expected = ref_mem[address]
Actual   = DUT Read Data
```

### PASS Example

```
Expected : 12345678
Received : 12345678

PASS
```

### FAIL Example

```
Expected : 12345678
Received : ABCDEF00

FAIL
```

---

## 7. Environment

The environment instantiates and connects all verification components.

### Components

* Generator
* Driver
* Monitor
* Scoreboard
* Mailboxes

```
gen2drv
mon2scb
```

### Responsibilities

* Create components
* Connect mailboxes
* Start execution
* Manage simulation flow

---

## 8. Test

The test configures and executes the verification environment.

### Configuration

```
Transaction Count = 10
```

### Test Flow

```
Create Environment
        |
        v
Configure Transactions
        |
        v
Run Environment
        |
        v
Wait for Completion
        |
        v
Display Results
```

---

## 9. Program Block

Acts as the simulation entry point.

```
Create Test
     |
     v
Run Test
```

---

# APB Slave DUT

The DUT implements a simple APB-compliant slave with memory-mapped storage.

### Features

* 256 Memory Locations
* Address Range: `0x00 – 0xFF`
* APB Write Support
* APB Read Support
* Ready Response Generation
* Error Response Handling

---

# APB Slave FSM

```
            +------+
            | IDLE |
            +------+
                |
                | PSEL
                v

           +--------+
           | SETUP  |
           +--------+
                |
                v

          +---------+
          | ACCESS  |
          +---------+
                |
          PREADY = 1
                |
       +--------+--------+
       |                 |
       v                 v

    IDLE             SETUP
```

### State Description

**IDLE**

* Waits for a valid APB transfer.

**SETUP**

* Captures address and control signals.

**ACCESS**

* Executes read or write operation.
* Returns to IDLE or begins the next transfer.

---

# Expected Simulation Flow

```
RESET
  ↓
WRITE Address A
  ↓
READ Address A
  ↓
Monitor Captures Transaction
  ↓
Scoreboard Verification
  ↓
PASS / FAIL
  ↓
Repeat
```

---

# Sample Simulation Output

```
[GEN_WRITE] addr=25 write=1 wdata=12345678

[GEN_READ ] addr=25 write=0

[MON] addr=25 write=1 wdata=12345678

[SCB] WRITE addr=25 data=12345678

[MON] addr=25 write=0 rdata=12345678

[SCB] PASS addr=25 exp=12345678 got=12345678
```

---

# Simulation Results


<img width="681" height="790" alt="image" src="https://github.com/user-attachments/assets/368fccb0-ef3e-4d71-86cd-19545bdb1e2e" />


```
--------------------------------
PASS COUNT = 10
FAIL COUNT = 0
--------------------------------
```

---


<img width="1271" height="200" alt="image" src="https://github.com/user-attachments/assets/8f365b27-acf0-4b7e-bb32-f1a10387bc5f" />


# Project Highlights

* Layered SystemVerilog verification architecture
* Mailbox-based communication
* Transaction-level stimulus generation
* Passive bus monitoring
* Scoreboard-based functional verification
* Reference memory model
* Complete APB read/write protocol verification
* Reusable and modular verification components

---

# Key Learnings

* Developed a reusable layered verification environment.
* Applied transaction-based verification methodology.
* Implemented generator, driver, monitor, and scoreboard components.
* Understood APB protocol phases (IDLE, SETUP, ACCESS).
* Used mailbox communication for synchronization.
* Performed functional checking using a reference model.

---

# Conclusion

This project demonstrates the verification of an APB Slave using a modular SystemVerilog testbench architecture. The environment successfully generates APB transactions, drives protocol-compliant bus operations, monitors DUT activity, and validates functionality through a scoreboard-based reference model. The simulation achieved **100% successful read/write verification** with **zero functional mismatches**, providing a reusable foundation for more advanced APB verification environments.
