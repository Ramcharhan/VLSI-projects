# UART Transmitter and Receiver

## Description

This project implements a complete UART (Universal Asynchronous Receiver/Transmitter) communication system using Verilog HDL. The design includes separate UART Transmitter and Receiver modules integrated through a top-level module and verified using a dedicated Verilog testbench.

The project demonstrates serial data transmission and reception using standard UART framing, including Start Bit, 8 Data Bits, and Stop Bit.

The design was developed and simulated using Xilinx Vivado.

## Features

- UART Transmitter implementation
- UART Receiver implementation
- 8-bit serial data communication
- Start bit and stop bit handling
- Configurable clock cycles per bit
- Separate TX and RX control logic
- Busy and Done status signals
- Finite State Machine (FSM) based architecture
- Internal shift registers for serial data handling
- Integrated TX-to-RX loopback configuration
- Verilog testbench for functional verification

## System Architecture

The design consists of three main RTL modules:

### UART_TX

The transmitter converts 8-bit parallel data into a serial UART data stream.

The transmission frame consists of:

`Idle → Start Bit → 8 Data Bits → Stop Bit`

The transmitter uses a shift register to transmit the data **LSB first** through the `tx` output.

### UART_RX1

The receiver detects the Start Bit, samples the incoming serial data at the configured bit timing, stores the received bits in a shift register, verifies the Stop Bit, and provides the received byte through `data_out`.

The receiver frame consists of:

`Start Bit → 8 Data Bits → Stop Bit`

### UART_TOP

The top-level module integrates the UART transmitter and receiver.

In this implementation, the transmitter output `tx` is directly connected to the receiver input `rx`, creating a **UART loopback path** for verification.

This allows transmitted data to be received by the UART receiver without requiring an external serial device.

## Inputs

### UART_TOP Inputs

| Signal | Width | Description |
|---|---:|---|
| `clk` | 1 bit | System clock |
| `rst` | 1 bit | Asynchronous reset |
| `tx_start` | 1 bit | Starts transmission |
| `data_in` | 8 bits | Parallel data to transmit |

## Outputs

| Signal | Width | Description |
|---|---:|---|
| `tx` | 1 bit | UART serial transmission output |
| `tx_done` | 1 bit | Indicates completion of transmission |
| `tx_busy` | 1 bit | Indicates transmitter is active |
| `data_out` | 8 bits | Received parallel data |
| `rx_done` | 1 bit | Indicates successful reception |
| `rx_busy` | 1 bit | Indicates receiver is active |

## UART Transmitter States

The transmitter uses five states:

### IDLE
The transmitter waits for `tx_start`. The TX line remains HIGH when idle.

### START_BIT
The transmitter sends a LOW Start Bit for one bit period.

### DATA_BITS
The 8-bit input data is shifted out serially, starting with the Least Significant Bit (LSB).

### STOP_BIT
The transmitter sends a HIGH Stop Bit for one bit period.

### DONE
The transmission is completed and `tx_done` is asserted before returning to IDLE.

## UART Receiver States

The receiver also uses five states:

### IDLE
The receiver waits for the serial input to go LOW, indicating the beginning of a Start Bit.

### START_BIT
The receiver verifies the Start Bit at approximately the middle of the bit period.

### DATA_BITS
The receiver samples eight serial data bits and stores them in the internal shift register.

### STOP_BIT
The receiver checks that the Stop Bit is HIGH.

### DONE
The received byte is transferred to `data_out` and `rx_done` is asserted.

## Parameter

The UART modules use the following parameter:

```text
CLKS_PER_BIT = 434
```

This parameter determines the number of system clock cycles corresponding to one UART bit period.

For simulation, the testbench uses:

```text
CLKS_PER_BIT = 10
```

This reduces the simulation time while maintaining the same UART transmission structure.

## Testbench

The testbench verifies the complete UART loopback system.

Two different 8-bit data patterns are transmitted:

```text
10110010
11001100
```

The transmitted data from the UART transmitter is directly connected to the receiver through the top-level module.

The testbench monitors:

- TX serial output
- TX Busy status
- TX Done status
- RX Busy status
- RX Done status
- Input data
- Received data

The testbench waits for `rx_done` and verifies that the transmitted data is successfully received.

## Verification Flow

The overall data flow is:

```text
Parallel Data
     |
     v
UART Transmitter
     |
     | Serial TX
     v
UART Receiver
     |
     v
Received Parallel Data
```

In the top-level design:

```text
TX output ───────────> RX input
```

This creates a loopback configuration for functional verification.

## Project Files

```text
UART/
│
├── UART_RX1.v
├── UART_TX.v
├── UART_TOP.v
├── UART_tb.v
├── UART_Waveform.png
├── UART_Blockdiagram.png
└── README.md
```

### File Description

- `UART_RX1.v` – UART Receiver RTL design
- `UART_TX.v` – UART Transmitter RTL design
- `UART_TOP.v` – Top-level UART integration module
- `UART_tb.v` – UART verification testbench
- `UART_Waveform.png` – Simulation waveform
- `UART_Blockdiagram.png` – UART architecture/block diagram
- `README.md` – Project documentation

## Tools Used

- Verilog HDL
- Xilinx Vivado
- RTL Simulation

## Learning Outcomes

Through this project, I gained practical experience in:

- UART communication protocol
- Serial data transmission and reception
- UART frame structure
- Start and Stop Bit handling
- LSB-first data transmission
- Shift register implementation
- Baud-rate timing concepts
- FSM-based RTL design
- Transmitter and Receiver integration
- Loopback verification
- Verilog testbench development
- RTL simulation using Xilinx Vivado

## Applications

UART is widely used for:

- Microcontroller communication
- FPGA development boards
- Serial debugging
- Embedded systems
- Sensor interfaces
- Communication between digital systems
- FPGA-to-PC serial communication

## Future Improvements

The current implementation can be extended with additional features such as:

- Configurable baud-rate generator
- Parameterized data width
- Parity bit support
- Multiple stop-bit configurations
- Framing error detection
- Overrun error detection
- RX input synchronization
- FIFO-based UART buffering
- Independent TX and RX baud-rate generation

## Author

**Ram Charhan**

ECE Student | VLSI & Digital Design Enthusiast
