# Android Pydantic-Core

Pre-compiled [pydantic-core](https://pypi.org/project/pydantic-core/) wheels for **Android (Termux)**.

This repository provides pre-built wheels that install instantly via `pip`.

## Supported Versions

| Python | Status |
|--------|--------|
| 3.9    | ✅     |
| 3.10   | ✅     |
| 3.11   | ✅     |
| 3.12   | ✅     |
| 3.13   | ✅     |
| 3.14   | ✅     |

## Installation

### Method 1: Automated Script (Recommended)

Run the installer directly:

```bash
bash <(curl -s https://raw.githubusercontent.com/S0methingSomething/android-pydantic-core/main/install_pydantic_core.sh)
```

### Method 2: Manual Install

1. Go to the [latest release](https://github.com/S0methingSomething/android-pydantic-core/releases/latest)
2. Download the wheel matching your Python version and architecture 
3. Install with pip:

```bash
pip install pydantic_core-*.whl
```

## How It Works

This GitHub Action:
1. Checks for new pydantic-core releases on PyPI monthly
2. Cross-compiles wheels for Android using the Android NDK
3. Uses a custom sysconfig mock to trick maturin into building for Termux
4. Applies RPATH fix for Termux library locations
5. Publishes wheels as GitHub Releases

## Technical Details

- Built with **NDK r25b** (API 24)
- Includes **RPATH** fix for Termux library location
- Linked with **`--no-as-needed`** to ensure `libpython` loading

## Credits

Forked from [Eutalix/android-pydantic-core](https://github.com/Eutalix/android-pydantic-core).
