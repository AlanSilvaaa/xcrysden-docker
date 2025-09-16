# XCrySDen on Docker

Docker images for running [XCrySDen](http://www.xcrysden.org/XCrySDen.html), a crystalline and molecular structure visualization program. This project provides multi-architecture Docker images (amd64 and arm64) that eliminate the need to install XCrySDen locally.

Visit our [Docker Hub repository](https://hub.docker.com/repository/docker/teg57/xcrysden/general) to pull pre-built images.

## Available Tags

This project offers different Docker image variants to suit various use cases:

### `teg57/xcrysden:1.6.2-web`
**Web Interface Version** - Run XCrySDen in your browser using noVNC
- No X server required
- Access through web browser at `localhost:6080`
- Perfect for Windows, macOS, and remote access
- **📖 [Detailed Documentation](./tags/web/README.md)**

### `teg57/xcrysden:1.6.2-min`
**Minimal Version** - Direct X11 forwarding
- Lightweight Docker image
- Requires X server setup on host machine
- Direct graphical interface
- **📖 [Detailed Documentation](./tags/min/README.md)**

## Quick Start

### Web Version (Recommended for beginners)
```bash
docker run --init --rm -p 6080:6080 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-web
```
Then open `http://localhost:6080/vnc.html` in your browser.

### Minimal Version (Requires X server)
```bash
docker run --init --rm -e DISPLAY=host.docker.internal:0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-min
```

## Getting Detailed Instructions

Each tag has its own comprehensive documentation with:
- Complete setup instructions
- Architecture-specific commands
- Build instructions for local development
- Troubleshooting guides

**👉 Visit the [`tags/`](./tags/) folder and select your preferred version for detailed instructions.**

## Key Features

- **Multi-architecture support**: Both amd64 and arm64
- **Multiple interface options**: Web browser or direct X11
- **Easy volume mounting**: Access your local files seamlessly
- **Pre-built images**: No compilation required
- **Comprehensive documentation**: Detailed guides for each variant

## Author

[@AlanSilvaaa](https://github.com/AlanSilvaaa/)