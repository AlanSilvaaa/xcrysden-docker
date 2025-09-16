# XCrySDen - Crystalline Structure Visualization

![Docker Pulls](https://img.shields.io/docker/pulls/teg57/xcrysden)
![Docker Image Size](https://img.shields.io/docker/image-size/teg57/xcrysden)
![Docker Stars](https://img.shields.io/docker/stars/teg57/xcrysden)

**Run XCrySDen anywhere without installation hassles!**

XCrySDen is a crystalline and molecular structure visualization program. This Docker image eliminates the need for complex local installations, dependency management, and X server configuration issues.

## Quick Start

### Web Interface (Recommended)
```bash
docker run --init --rm -p 6080:6080 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-web
```
**Then open http://localhost:6080/vnc.html in your browser**

### Direct X11 (Minimal)
```bash
docker run --init --rm -e DISPLAY=host.docker.internal:0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-min
```

## Available Tags

| Tag | Description | Size | Use Case |
|-----|-------------|------|----------|
| `1.6.2-web` | Web interface via noVNC | ~800MB | **Recommended** - Works anywhere, no X server needed |
| `1.6.2-min` | Minimal X11 version | ~500MB | Lightweight, requires X server setup |

## Key Features

- **Multi-architecture**: Supports both AMD64 and ARM64
- **No installation required**: Run instantly with Docker
- **Web interface option**: Access through any modern browser
- **File sharing**: Mount local directories for easy file access
- **Cross-platform**: Works on Windows, macOS, and Linux

## What's Inside

- **XCrySDen 1.6.2** - Latest stable version
- **All dependencies** - Pre-configured and ready to use
- **File format support** - XSF, CUBE, PDB, and more

## Documentation
The documentation can be found in the `tags/` folder on the GitHub repository:
- **Detailed Documentation**: [GitHub Repository](https://github.com/AlanSilvaaa/xcrysden-docker)
- **Tag-specific guides**: Check the `/tags` folder in the repo

---

**Author: [@AlanSilvaaa](https://github.com/AlanSilvaaa)**