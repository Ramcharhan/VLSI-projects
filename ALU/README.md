# 16-Bit Arithmetic Logic Unit (ALU)

## Description

This project implements a 16-bit Arithmetic Logic Unit (ALU) using Verilog HDL. The ALU performs various arithmetic, logical, shift, and comparison operations based on a 4-bit selection input.

The design was developed and simulated using Xilinx Vivado.

## Inputs and Outputs

### Inputs
- `a` - 16-bit input operand
- `b` - 16-bit input operand
- `sel` - 4-bit operation selection signal

### Outputs
- `result` - 16-bit output result
- `carry` - Carry output for arithmetic operations
- `zero` - Indicates when the result is zero

## ALU Operations

| Select (`sel`) | Operation |
|---|---|
| `0000` | Addition (`a + b`) |
| `0001` | Subtraction (`a - b`) |
| `0010` | Bitwise AND |
| `0011` | Bitwise OR |
| `0100` | Bitwise XOR |
| `0101` | Bitwise NOT (`~a`) |
| `0110` | NAND |
| `0111` | NOR |
| `1000` | XNOR |
| `1001` | Right Shift |
| `1010` | Left Shift |
| `1011` | Equal Comparison (`a == b`) |
| `1100` | Greater Than (`a > b`) |
| `1101` | Less Than (`a < b`) |
| `1110` | Multiplication (`a * b`) |
| `1111` | Output Zero |

## Tools Used

- Verilog HDL
- Xilinx Vivado

## Project Files

- `ALU16bit.v` - 16-bit ALU RTL design
- `ALU16bit_tb.v` - Verilog testbench
- Simulation waveform screenshot
- RTL/block diagram screenshot

## Verification

The ALU was verified using a Verilog testbench in Xilinx Vivado. Different input values and selection signals were applied to verify the supported arithmetic, logical, shift, and comparison operations.

## Learning Outcomes

Through this project, I gained practical experience in:

- Designing combinational circuits using Verilog HDL
- Implementing arithmetic and logical operations
- Using case statements for operation selection
- Generating carry and zero status outputs
- Writing Verilog testbenches
- Simulating and verifying RTL designs using Xilinx Vivado
