# SPI State Diagram

## Overview

The state diagram represents the Finite State Machine (FSM) used to control the operation of the SPI Master during serial communication. The FSM coordinates data loading, serial transmission, reception, and completion of the communication process.

## FSM States

### IDLE

The SPI controller waits for a valid start signal. During this state, no communication takes place and the Chip Select signal remains inactive.

### LOAD

Once communication begins, the transmit data is loaded into the shift register. The SPI Master prepares the Serial Clock and activates the Chip Select signal.

### TRANSMIT

The SPI Master serially transmits data to the slave through the MOSI line. At the same time, incoming data from the slave is received through the MISO line.

### RECEIVE

The received serial data is shifted into the receive register until all bits have been captured successfully.

### DONE

After completing the transmission and reception process, the FSM disables communication, deactivates the Chip Select signal, and returns to the IDLE state.

## State Transition

```
IDLE
  |
  V
LOAD
  |
  V
TRANSMIT
  |
  V
RECEIVE
  |
  V
DONE
  |
  +--------> IDLE
```

## Purpose

The FSM ensures:

- Proper communication sequencing
- Clock synchronization
- Accurate serial data transfer
- Reliable SPI operation
- Controlled communication between the Master and Slave devices

## File

**state_diagram_spi.png**

This diagram illustrates the finite state machine controlling the SPI communication protocol implemented in Verilog.
