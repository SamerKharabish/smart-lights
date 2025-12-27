# smart-lights

LED controller for ambient lighting in smart homes, based on an ESP32.

## Purpose

This project serves two purposes:

Implementing a production-grade ESP32-based LED controller for ambient lighting in a smart home.

Enhancing my overall embedded skill set by implementing MISRA-friendly C++ style code with a testable
design (clear module boundaries), static analysis, and a disciplined workflow.

## End-state Features

- LED strip driver via RMT
- Wi-Fi connectivity
- MQTT control interface
- OTA update capability
- IR remote control
- LUX sensor input to influence lighting scenes and brightness

## Target

### Hardware

- Chip variant: **ESP32-D0WD-V3** (revision 3)
- Crystal: 26 MHz
- CPU Cores : 2 (Dual)
- Max CPU Frequency : 240 MHz
- Flash Size : 4 MB
- Capabilities: Wi-Fi, BT

### Framework

- ESP-IDF

## How to build this project

### Prerequisites

- ESP-IDF installed (via the ESP-IDF VSCode extension or Espressif's install script)
- USB driver for the board

### Build / flash / monitor (VSCode)

1. Open this repo in VSCode
2. Select the ESP-IDF environment
3. Use the ESP-IDF commands:
    - **Build**
    - **Flash**
    - **Monitor**

### Build / flash / monitor (command line)

```bash
idf.py set-target esp32
idf.py menuconfig
idf.py build
idf.py -p <PORT> flash monitor
```
