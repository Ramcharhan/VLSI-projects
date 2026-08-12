# Mini RISC Processor

## Description

This project implements a simple 8-bit Mini RISC Processor using Verilog HDL. The processor is designed using multiple RTL modules including a Program Counter, Instruction Memory, Control Unit, Register File, ALU, Data Memory, and a Top-Level Processor module.

The design demonstrates fundamental processor concepts such as instruction fetching, instruction decoding, register operations, arithmetic and logical operations, memory read/write operations, and data write-back.

The project was developed and simulated using Xilinx Vivado.

## Features

- 8-bit Mini RISC Processor
- Modular RTL architecture
- Program Counter implementation
- Instruction Memory
- Control Unit
- 8-bit Register File with 8 registers
- 8-bit ALU
- Data Memory
- Arithmetic and logical operations
- Memory read and write operations
- FSM-based control logic
- Verilog HDL implementation
- Dedicated processor testbench

## Modules

### Program Counter

The Program Counter stores the current instruction address. It is reset to zero and increments by one on every positive clock edge after reset.

### Instruction Memory

The Instruction Memory contains 256 locations of 8-bit memory. Instructions are initialized for simulation and selected using the current Program Counter value.

### Control Unit

The Control Unit decodes the instruction opcode and generates control signals for register write, memory read, memory write, and ALU operation selection.

### Register File

The Register File contains eight 8-bit registers. It provides two combinational read ports and one synchronous write port.

### ALU

The ALU performs arithmetic and logical operations based on the `ALU_sel` control signal.

Supported operations include:

- Addition
- Subtraction
- Bitwise AND
- Bitwise OR
- Bitwise XOR
- Bitwise NOT

### Data Memory

The Data Memory contains 256 locations of 8-bit memory. It supports memory write operations on the positive edge of the clock and combinational memory read operations.

### Processor Top

The `processor_top` module integrates the Program Counter, Instruction Memory, Control Unit, Register File, ALU, and Data Memory to form the complete processor datapath.

## Inputs

### Processor Top Inputs

- `clk` – System clock
- `rst` – Asynchronous reset

## Outputs

- `pc[7:0]` – Current Program Counter value
- `instruction[7:0]` – Current instruction fetched from Instruction Memory

## Working Principle

The processor starts execution from Program Counter address zero after reset. The Program Counter provides the address to the Instruction Memory, which returns the corresponding 8-bit instruction.

The Control Unit decodes the instruction and generates the required control signals. Register operands are read from the Register File and supplied to the ALU. Depending on the instruction, the ALU performs the selected arithmetic or logical operation.

For memory operations, the ALU output is used as the Data Memory address. Data can either be written to Data Memory or read from it. The resulting ALU output or memory data is selected as the write-back data for the Register File.

The Program Counter continues incrementing to fetch subsequent instructions.

## Tools Used

- Verilog HDL
- Xilinx Vivado
- RTL Simulation

## Project Files

- `program_counter.v` – Program Counter RTL design
- `instruction_memory.v` – Instruction Memory
- `control_unit.v` – Instruction decoding and control logic
- `register_file.v` – 8-register, 8-bit Register File
- `ALU.v` – Arithmetic and Logic Unit
- `data_memory.v` – Data Memory
- `processor_top.v` – Top-level processor integration
- `processor_tb.v` – Processor testbench
- `README.md` – Project documentation

## Simulation and Verification

The processor was verified using a Verilog testbench in Xilinx Vivado.

The testbench generates the system clock, applies and releases reset, allows the processor to execute for multiple clock cycles, and monitors the Program Counter and fetched instruction during simulation.

The simulation helps verify the instruction-fetching sequence and overall integration of the processor modules.

## Learning Outcomes

Through this project, I gained practical experience in:

- Processor datapath design
- RTL module integration
- Program Counter design
- Instruction Memory implementation
- Control Unit design
- Register File implementation
- ALU design
- Data Memory design
- Instruction decoding
- Data write-back
- Verilog HDL coding
- RTL simulation and verification
- Xilinx Vivado design flow

## Applications

- Basic processor architecture studies
- FPGA-based processor design
- Digital system design
- ASIC RTL design
- Embedded processor concepts
- Computer architecture learning

## Author

**Bandi Ram Charan**

ECE Student | VLSI & Digital Design Enthusiast
