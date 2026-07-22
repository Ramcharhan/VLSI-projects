# Advanced Asynchronous FIFO

## Description

This project implements an Advanced Asynchronous FIFO (First-In First-Out) using Verilog HDL. Unlike a basic asynchronous FIFO, this design incorporates Gray-code pointers and two-stage synchronizers to safely transfer pointer information between independent write and read clock domains, reducing the risk of metastability.

The design was developed and simulated using Xilinx Vivado.

## Features

- Independent write and read clock domains
- Parameterized data width and address width
- Configurable FIFO depth
- Binary read and write pointers
- Gray-code pointer generation
- Two-stage synchronizers for clock domain crossing (CDC)
- Safe pointer synchronization between clock domains
- Full and Empty flag generation using synchronized Gray-code pointers
- Parameterized Verilog HDL implementation

## Parameters

| Parameter | Default Value | Description |
|-----------|---------------|-------------|
| `DATA_WIDTH` | 8 | Width of each data word |
| `ADDR_WIDTH` | 4 | Address width of the FIFO |

FIFO Depth:

`DEPTH = 2^ADDR_WIDTH`

With the default parameter values, the FIFO contains 16 memory locations.

## Inputs

- `wr_clk` – Write clock
- `rd_clk` – Read clock
- `rst` – Asynchronous reset
- `wr_en` – Write enable
- `rd_en` – Read enable
- `data_in` – Input data

## Outputs

- `data_out` – Output data
- `full` – FIFO Full flag
- `empty` – FIFO Empty flag

## Architecture

The design uses binary read and write pointers for addressing the memory. These pointers are converted into Gray-code, which changes only one bit between consecutive values, making it suitable for clock-domain crossing.

To safely transfer Gray-code pointers across different clock domains, two-stage flip-flop synchronizers are implemented. The synchronized Gray-code pointers are then used for Full and Empty flag generation.

## Project Files

- `ADV_AFIFO.v` – Advanced Asynchronous FIFO RTL design
- `ADV_AFIFO_tb.v` – Verilog testbench
- `syn_2ff.v` – Two-stage synchronizer module
- Simulation waveform
- RTL/Block diagram

## Tools Used

- Verilog HDL
- Xilinx Vivado

## Verification

The design was verified using a Verilog testbench in Xilinx Vivado. Simulation includes write and read operations using independent clock domains, pointer synchronization, Gray-code conversion, and verification of Full and Empty flag generation.

## Learning Outcomes

Through this project, I gained practical experience in:

- Clock Domain Crossing (CDC)
- Gray-code pointer implementation
- Two-stage synchronizer design
- Advanced FIFO architecture
- RTL design using Verilog HDL
- Parameterized digital design
- Functional verification using simulation
- Xilinx Vivado design flow

## Applications

- High-speed digital systems
- Processor and peripheral communication
- FPGA-based communication systems
- Data buffering between different clock domains
- ASIC and FPGA RTL design

## Author

**Ram Charhan**

ECE Student | VLSI and Digital Design Enthusiast
