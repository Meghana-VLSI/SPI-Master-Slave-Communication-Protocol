# Testbench

## Overview

This folder contains the Verilog testbench developed for verifying the functionality of the SPI Master-Slave Communication system.

## Description

The testbench generates all required input signals including clock, reset, start signal, and test data. It stimulates both the SPI Master and SPI Slave modules and observes the output signals to verify correct protocol operation.

The testbench ensures that data transmission, reception, clock synchronization, and chip select functionality operate according to the SPI communication protocol.

## Verification Performed

- Clock generation
- Reset generation
- Master initialization
- Slave communication
- Data transmission
- Data reception
- Serial communication timing
- Functional verification

## File

- spi_tb.v

The testbench verifies the complete SPI communication process through simulation.
