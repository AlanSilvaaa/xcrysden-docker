# Dockerfile for XCRYSDEN 1.6.2 Minimal

This Dockerfile sets up a minimal environment for running XCRYSDEN 1.6.2 directly. This version requires X11 forwarding to display the graphical interface and is ideal for users who prefer a lightweight setup or already have an X server configured.

>[!IMPORTANT]
> This version requires X11 forwarding. On Windows, you'll need an X server like VcXsrv, Xming, or X410. On macOS, you'll need XQuartz. On Linux, X11 forwarding should work out of the box.

## Pull and Run from DockerHub

You can run the pre-built image directly from DockerHub without building it locally. This will download the image if you don't have it already and run it:

### amd64 Architecture
```bash
docker run --platform linux/amd64 --init --rm -e DISPLAY=host.docker.internal:0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-min
```

### arm64 Architecture
```bash
docker run --platform linux/arm64 --init --rm -e DISPLAY=host.docker.internal:0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-min
```

## Build and Run Locally
### amd64 Architecture
For amd64 architecture, first build the Docker image using the following command:
```bash
docker buildx build --platform linux/amd64 --tag teg57/xcrysden:1.6.2-min-amd64 -f dockerfile-amd --load .
```

Then run the Docker container with:
```bash
docker run --platform linux/amd64 --init --rm -e DISPLAY=host.docker.internal:0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-min-amd64
```

### arm64 Architecture
For arm64 architecture, first build the Docker image using the following command:
```bash
docker buildx build --platform linux/arm64 --tag teg57/xcrysden:1.6.2-min-arm64 -f dockerfile-arm --load .
```

Then run the Docker container with:
```bash
docker run --platform linux/arm64 --init --rm -e DISPLAY=host.docker.internal:0 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-min-arm64
```

## Setting up X11 Forwarding

### Windows
1. Install an X server like VcXsrv, Xming, or X410
2. Configure the X server to allow connections from Docker
3. For VcXsrv: Start with "Disable access control" checked

### macOS
1. Install XQuartz: `brew install --cask xquartz`
2. Start XQuartz and enable "Allow connections from network clients" in preferences
3. Run: `xhost +localhost`

### Linux
X11 forwarding should work out of the box. If you encounter issues, try:
```bash
xhost +local:docker
```

>[!TIP]
> If XCrySDen doesn't appear, check that your X server is running and properly configured. The container will start XCrySDen automatically.

## Build image into one single image
To build the image into one single image, use the following command:

```bash
docker buildx build --platform linux/amd64 -f dockerfile-amd  -t teg57/xcrysden:1.6.2-min-amd64  --push .
docker buildx build --platform linux/arm64 -f dockerfile-arm  -t teg57/xcrysden:1.6.2-min-arm64  --push .

docker buildx imagetools create -t teg57/xcrysden:1.6.2-min teg57/xcrysden:1.6.2-min-amd64 teg57/xcrysden:1.6.2-min-arm64
```