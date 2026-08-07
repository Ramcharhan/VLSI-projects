# Serial Peripheral Interface (SPI) Master Controller

## Description

This project implements a Serial Peripheral Interface (SPI) Master Controller using Verilog HDL. The controller performs serial data transmission through a Finite State Machine (FSM) consisting of IDLE, LOAD, SHIFT, and DONE states. The design serially transmits an 8-bit data word over the MOSI line while generating the SPI clock and Slave Select signals.

The project was designed and simulated using Xilinx Vivado.

## Features

- SPI Master Controller implementation
- 8-bit serial data transmission
- Finite State Machine (FSM) based design
- IDLE, LOAD, SHIFT, and DONE states
- Serial output through MOSI
- Automatic Slave Select (SS) control
- Clock generation for SPI communication
- Transfer completion indication
- Verilog HDL implementation

## Inputs

- `clk` – System clock
- `rst` – Asynchronous reset
- `start` – Starts SPI transmission
- `data_in[7:0]` – 8-bit parallel input data

## Outputs

- `MOSI` – Master Out Slave In serial data
- `SCLK` – Serial clock
- `SS` – Slave Select signal
- `Done` – Indicates completion of data transmission

## State Description

### IDLE
The controller waits for the `start` signal while keeping the Slave Select inactive.

### LOAD
The input data is loaded into the internal shift register, and the bit counter is initialized.

### SHIFT
The controller transmits one bit per clock cycle through the MOSI line by shifting the register left until all eight bits are transmitted.

### DONE
The transmission is completed, the Slave Select signal is deasserted, and the controller returns to the IDLE state.

## Working Principle

When the `start` signal is asserted, the controller loads the 8-bit input data into an internal shift register. During the SHIFT state, the most significant bit (MSB) is transmitted on the MOSI line while the shift register shifts left after each clock cycle. After transmitting all eight bits, the controller enters the DONE state before returning to IDLE, preparing for the next transmission.

## Tools Used

- Verilog HDL
- Xilinx Vivado

## Project Files

- `SPI.v` – SPI Master Controller RTL design
- `SPI_tb.v` – Verilog testbench
- Simulation waveform
- FSM state diagram
- RTL/Block diagram

## Simulation and Verification

The design was verified using a Verilog testbench in Xilinx Vivado. Simulation confirmed correct FSM transitions, serial data transmission, Slave Select operation, SPI clock generation, and transmission completion.

## Learning Outcomes

Through this project, I gained practical experience in:

- SPI communication protocol
- Finite State Machine (FSM) design
- Shift register implementation
- Serial data transmission
- Verilog HDL coding
- RTL simulation and functional verification
- Xilinx Vivado design flow

## Applications

- Microcontroller to peripheral communication
- Sensor interfaces
- EEPROM and Flash memory communication
- ADC and DAC interfaces
- FPGA-based embedded systems
- ASIC digital communication interfaces

## Author

**Ram Charhan**

ECE Student | VLSI and Digital Design Enthusiast
