# Advanced Peripheral Bus (APB) Slave Controller

## Description

This project implements an Advanced Peripheral Bus (APB) Slave Controller using Verilog HDL. The design models the APB transfer protocol by implementing the three primary bus phases: IDLE, SETUP, and ACCESS. The controller monitors APB control signals and generates a transfer completion indication when the transaction is successfully completed.

The design was developed and simulated using Xilinx Vivado.

## Features

- APB Slave Controller implementation
- Three-state Finite State Machine (FSM)
- IDLE, SETUP, and ACCESS states
- APB protocol compliant state transitions
- Transfer completion indication
- Synchronous sequential design
- Asynchronous reset
- Verilog HDL implementation

## Inputs

- `clk` – System clock
- `rst` – Asynchronous reset
- `PSEL` – Peripheral select signal
- `PENABLE` – Enable signal for the access phase
- `PREADY` – Slave ready signal indicating transaction completion

## Output

- `transfer_ready` – Indicates successful completion of an APB transfer

## State Description

### IDLE
The controller waits for the `PSEL` signal to initiate a new APB transaction.

### SETUP
After `PSEL` is asserted, the controller enters the SETUP phase and waits for the `PENABLE` signal.

### ACCESS
During the ACCESS phase, the controller waits for the slave to assert `PREADY`. Once `PREADY` becomes HIGH, the transfer is completed, `transfer_ready` is asserted, and the controller returns to the IDLE state.

## Working Principle

The APB Slave Controller follows the standard APB transaction sequence. A transfer begins when the master asserts `PSEL`, followed by `PENABLE` to enter the ACCESS phase. The controller remains in the ACCESS state until the slave indicates readiness by asserting `PREADY`. Upon successful completion of the transaction, the controller generates the `transfer_ready` signal and returns to the IDLE state, ready for the next transfer.

## Tools Used

- Verilog HDL
- Xilinx Vivado

## Project Files

- `APB.v` – APB Slave Controller RTL design
- `APB_tb.v` – Verilog testbench
- Simulation waveform
- FSM state diagram
- RTL/Block diagram

## Simulation and Verification

The design was verified using a Verilog testbench in Xilinx Vivado. Simulation confirmed correct state transitions through the IDLE, SETUP, and ACCESS phases, proper handling of APB control signals, transfer completion, and reset functionality.

## Learning Outcomes

Through this project, I gained practical experience in:

- AMBA APB protocol fundamentals
- APB Slave Controller design
- Finite State Machine (FSM) implementation
- Bus protocol state transitions
- Verilog HDL coding
- RTL simulation and functional verification
- Xilinx Vivado design flow

## Applications

- AMBA-based SoC designs
- Microcontroller peripherals
- Memory-mapped peripheral interfaces
- FPGA-based embedded systems
- ASIC digital design
- Bus interface controllers

## Author

**Ram Charhan**

ECE Student | VLSI and Digital Design Enthusiast
