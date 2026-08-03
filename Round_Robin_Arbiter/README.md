# Round Robin Arbiter

## Description

This project implements a 4-Request Round Robin Arbiter using Verilog HDL. The arbiter allocates access to a shared resource among four requesters using a round robin scheduling algorithm, ensuring fair access by rotating the priority after each successful grant.

The design was developed and simulated using Xilinx Vivado.

## Features

- 4-request Round Robin arbitration
- Fair resource allocation
- Rotating priority mechanism
- Pointer-based arbitration
- One-hot grant output
- Synchronous sequential design
- Asynchronous reset
- Verilog HDL implementation

## Inputs

- `clk` – System clock
- `rst` – Asynchronous reset
- `req[3:0]` – Request signals from four requesters

## Outputs

- `grant[3:0]` – One-hot grant signal
