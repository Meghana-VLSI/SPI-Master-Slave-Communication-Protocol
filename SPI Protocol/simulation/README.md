# Simulation

## Overview

This folder contains the simulation files and waveform results of the SPI Master-Slave Communication project. Functional simulation is performed using Vivado to verify the correctness of the SPI protocol implementation before synthesis.

## Description

The simulation validates the communication between the SPI Master and SPI Slave by observing the behavior of the MOSI, MISO, SCLK, and Chip Select (CS) signals. A Verilog testbench is used to generate the clock, reset, and input stimulus required to verify the design.

The generated waveforms confirm that the SPI Master successfully transmits serial data to the SPI Slave while simultaneously receiving data from the slave. The timing relationships between all communication signals are verified according to SPI protocol specifications.

## Simulation Verification

- SPI Master initialization
- SPI Slave activation
- Serial Clock (SCLK) generation
- MOSI data transmission
- MISO data reception
- Chip Select (CS) operation
- Full-duplex communication
- Correct data synchronization

## Files

- simulation_spi.png
- schematic_spi.png


These waveform images demonstrate the successful operation of the SPI communication system.
