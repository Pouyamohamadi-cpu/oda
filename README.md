
# Oda
![Oda Make](https://img.shields.io/badge/Oda-make-blue?style=for-the-badge)
![Version](https://img.shields.io/badge/version-1.0.0-red?style=for-the-badge)
![License](https://img.shields.io/badge/license-GNU_v3-green?style=for-the-badge)

Oda is a high-performance, lightweight package manager designed for the **G** programming language , C , C++ , C#, F#, Vlang, NASM & general D projects + many another programing languages. It automates the process of downloading packages, extracting archives, and compiling source code.

## Features
.
- **Auto-Compilation**: Automatically uses compiler in config.odac to compile D source code found in packages.
- **Mirror Support**: Downloads packages from configurable mirror URLs.
- **Dependency Free**: Built with minimal dependencies for fast execution.

## Installation

### Linux

Download the `oda` executable (source or binary) and move it to your path:

```bash
# If compiling from source (requires D compiler)
dmd oda.d -of=oda

# Move to global bin
sudo mv oda /usr/local/bin/
```

### Build from Source

Clone the repository and build:

```bash
git clone https://github.com/pouyamohamadi-cpu/oda.git
cd oda
dmd oda.d -of=oda
```

## Usage

To install a source (`.oda` file), simply run:

```bash
oda <package_name>.oda
```
this well get <package_name>.oda from current folder then read config.odac on it for settings.
Example:

```bash
oda glang_foroda.oda
```

### Workflow

1. It checks if the package is a valid RAR archive.
2. It extracts contents to the working directory (e.g., `code/` folder).
3. It searches for D source files (`.d`) inside the `code/` folder.
4. It attempts to compile them using `dmd` or compiler in config.

### Getting Help

For usage information and options:

```bash
oda -h
```

or

```bash
oda --help
```

## Creating an Oda Package

An Oda package is a RAR archive with a specific structure:

```
package_name.oda
├── code/
│   └── package_name.d/.c/.cpp/.v           # Your D source code
└── config.odac           # Package configuration
```

1. Create your source code in a `code` folder.
2. Create a `config.odac` file.
3. Archive them using RAR:
   ```bash
   rar a package_name.oda code config.odac
   ```

## License

This project is licensed under the GNU General Public License v3.0.

Please see the [LICENSE](LICENSE) file in this repository for the full text of the license.
```
