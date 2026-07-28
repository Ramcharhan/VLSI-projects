# Traffic Light Controller

## Description

This project implements a Traffic Light Controller (TLC) using Verilog HDL based on a Finite State Machine (FSM). The controller manages traffic flow between the North-South (NS) and East-West (EW) directions by controlling Red, Yellow, and Green traffic lights according to predefined timing intervals.

The design was developed and simulated using Xilinx Vivado.

## Features

- Finite State Machine (FSM) based design
- Four-state traffic light control
- Independent North-South and East-West traffic signals
- Configurable timing using a counter
- Automatic state transitions
- Asynchronous reset
- Verilog HDL implementation

## Inputs

- `clk` – System clock
- `rst` – Asynchronous reset

## Outputs

### North-South Signals
- `NS_G` – Green light
- `NS_Y` – Yellow light
- `NS_R` – Red light

### East-West Signals
- `EW_G` – Green light
- `EW_Y` – Yellow light
- `EW_R` – Red light

## State Description

### S0
- North-South: Green
- East-West: Red
- Duration: 10 clock cycles

### S1
- North-South: Yellow
- East-West: Red
- Duration: 3 clock cycles

### S2
- North-South: Red
- East-West: Green
- Duration: 10 clock cycles

### S3
- North-South: Red
- East-West: Yellow
- Duration: 3 clock cycles

After completing S3, the controller returns to S0 and repeats the traffic signal sequence continuously.

## Working Principle

The controller uses a 4-state FSM along with a counter to control the duration of each traffic signal. The counter determines how long each state remains active before transitioning to the next state. This ensures safe and sequential traffic flow between the two directions.

## Tools Used

- Verilog HDL
- Xilinx Vivado

## Project Files

- `TLC.v` – Traffic Light Controller RTL design
- `TLC_tb.v` – Verilog testbench
- Simulation waveform
- State diagram
- RTL/Block diagram

## Simulation and Verification

The design was verified using a Verilog testbench in Xilinx Vivado. Simulation confirmed correct state transitions, traffic signal timing, reset operation, and continuous cyclic operation of the controller.

## Learning Outcomes

Through this project, I gained practical experience in:

- Finite State Machine (FSM) design
- Sequential digital circuit design
- Counter-based timing control
- Traffic signal sequencing
- Verilog HDL coding
- RTL simulation and functional verification
- Xilinx Vivado design flow

## Applications

- Intelligent traffic signal systems
- Smart city infrastructure
- Embedded traffic control
- FPGA-based control systems
- Digital controller design

## Author

**Ram Charhan**

ECE Student | VLSI and Digital Design Enthusiast
