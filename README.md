# synchronous-fifo-verification
SystemVerilog verification of a synchronous FIFO using a self-checking testbench.
# FIFO Design and Verification

## 📌 Project Overview

This project implements and verifies a **FIFO (First-In-First-Out) memory** using SystemVerilog.

The project includes the RTL design of the FIFO along with a modular SystemVerilog testbench environment for functional verification.

## 📁 Project Structure

```text
FIFO-Project/
│
├── design/
│   └── fifo.sv
│
├── tb/
│   ├── fifo_driver.sv
│   ├── fifo_if.sv
│   ├── fifo_monitor.sv
│   ├── fifo_scoreboard.sv
│   └── fifo_tb.sv
│
└── README.md
