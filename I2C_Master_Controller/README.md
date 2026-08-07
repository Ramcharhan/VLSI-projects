# I²C Master Controller

## Description

This project implements an I²C (Inter-Integrated Circuit) Master Controller using Verilog HDL. The controller performs serial communication by generating the START and STOP conditions, transmitting the slave address, receiving an acknowledgment (ACK), and sending 8-bit data to the slave device.

The design is implemented using a Finite State Machine (FSM) and was developed and simulated using Xilinx Vivado.

## Features

- I²C Master Controller implementation
- FSM-based architecture
- START and STOP condition generation
- 7-bit slave address transmission
- ACK detection
- 8-bit data transmission
- Serial communication using SDA and SCL
- Transfer completion indication
- Verilog HDL implementation

## Inputs

- `clk` – System clock
- `rst` – Asynchronous reset
- `start` – Starts I²C communication
- `ack` – Acknowledgment signal from slave
- `address[6:0]` – 7-bit slave address
- `data_in[7:0]` – Data to be transmitted

## Outputs

- `SCL` – Serial Clock Line
- `SDA` – Serial Data Line
- `done` – Indicates successful completion of data transmission

## FSM States

### IDLE
The controller waits for the `start` signal.

### START
Generates the I²C START condition and loads the slave address into the shift register.

### ADDRESS
Serially transmits the 7-bit slave address along with the write bit.

### ACK
Waits for the acknowledgment signal from the slave device. If ACK is received, the controller proceeds to data transmission; otherwise, it moves to the STOP state.

### DATA
Serially transmits the 8-bit data to the slave device.

### STOP
Generates the I²C STOP condition, asserts the `done` signal, and returns to the IDLE state.

## Working Principle

The communication begins when the `start` signal is asserted. The controller generates the START condition and transmits the slave address followed by the write bit. After receiving the acknowledgment from the slave, the controller sends the 8-bit data serially over the SDA line while generating the SCL clock. Once the transmission is complete, the controller generates the STOP condition and asserts the `done` signal.

## Tools Used

- Verilog HDL
- Xilinx Vivado

## Project Files

- `I2C.v` – I²C Master Controller RTL design
- `I2C_tb.v` – Verilog testbench
- Simulation waveform
- FSM state diagram
- RTL/Block diagram

## Simulation and Verification

The design was verified using a Verilog testbench in Xilinx Vivado. Simulation confirmed correct generation of START and STOP conditions, address transmission, ACK handling, data transmission, and successful completion of the communication process.

## Learning Outcomes

Through this project, I gained practical experience in:

- I²C communication protocol
- Finite State Machine (FSM) design
- Serial communication interfaces
- Shift register implementation
- Address and data transmission
- RTL design using Verilog HDL
- Functional verification using Xilinx Vivado

## Applications

- Sensor interfacing
- EEPROM communication
- Real-Time Clock (RTC) modules
- Microcontroller peripheral communication
- FPGA-based embedded systems
- ASIC communication interfaces

## Author

**Ram Charhan**

ECE Student | VLSI and Digital Design Enthusiast
