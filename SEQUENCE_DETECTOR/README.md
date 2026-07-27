# Sequence Detector (1011)

## Description

This project implements a Moore Finite State Machine (FSM) Sequence Detector using Verilog HDL. The design detects the binary sequence **1011** from a serial input stream and generates an output when the complete sequence is detected.

The design supports overlapping sequence detection, allowing the detector to continue searching for new occurrences without resetting to the initial state after each successful detection.

The project was designed and simulated using Xilinx Vivado.

## Features

- Moore Finite State Machine (FSM)
- Detects the binary sequence **1011**
- Supports overlapping sequence detection
- Five-state FSM implementation
- Synchronous sequential design
- Asynchronous reset
- Verilog HDL implementation

## Inputs

- `clk` – System clock
- `rst` – Asynchronous reset
- `in` – Serial input bit stream

## Output

- `out` – Becomes HIGH when the sequence **1011** is detected

## State Description

- **S0** – Initial state
- **S1** – Detected `1`
- **S2** – Detected `10`
- **S3** – Detected `101`
- **S4** – Sequence `1011` detected (Output = 1)

## Working Principle

The FSM continuously monitors the serial input stream and changes states based on the received input bits. Once the sequence **1011** is detected, the output becomes HIGH for one clock cycle. The state transitions are designed to support overlapping sequence detection, allowing continuous
