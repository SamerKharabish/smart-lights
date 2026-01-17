# smart-lights

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

smart-lights is an ESP-based LED strip controller for ambient lighting which works as standalone or
integrated into a smart home. It supports automatic and manual control of brightness, correlated
color temperature (CCT) and effects via MQTT and infrared.

## Repository structure

This repository contains the following parts:

- components/: Modular components of the application
- docs/: Project documentation
- main/: Main application source code
- scripts/: Automation scripts (e.g., build, deploy, test)
- tests/: Unit, integration and system tests
- third-party/: Third-party libraries and dependencies

NOTE: See the [architecture](https://github.com/SamerKharabish/smart-lights/blob/main/docs/)
documentation for a detailed overview of the repository structure.

## Hardware

- **MCU**: ESP32-WROOM-32D
- 74HC595 shift register
- CCT LED strip
- 24V PSU
- IR receiver module

## Getting started

### Prerequisites

- ESP-IDF v5.x installed (via the ESP-IDF VSCode extension or Espressif's install script)
- USB-to-UART bridge driver installed
- USB connection to the ESP32

### Build

```bash
idf.py build
```

### Flash

```bash
idf.py -p PORT [-b BAUD] flash
```

### Monitor

```bash
idf.py -p PORT monitor
```

### Troubleshooting

- **Build fails**: Ensure ESP-IDF is properly installed and sourced.
- **Flashing issues**: Check USB port and driver; try idf.py -p PORT flash with a lower baud rate.

## Contributing

Contributions are always welcome!

See [CONTRIBUTING](https://github.com/SamerKharabish/smart-lights/blob/main/CONTRIBUTING.md) for
ways to get started.

Please adhere to this project's [CODE_OF_CONDUCT](https://github.com/SamerKharabish/smart-lights/blob/main/CODE_OF_CONDUCT.md).

For more details, see the [CHANGELOG](https://github.com/SamerKharabish/smart-lights/blob/main/CHANGELOG.md)
or open an issue on [GitHub](https://github.com/SamerKharabish/smart-lights).

Maintainer: [SamerKharabish](https://github.com/SamerKharabish).
