# Dockerfile for XCRYSDEN 1.6.2 with Web Interface

This Dockerfile sets up an environment for running XCRYSDEN 1.6.2 with a web interface using noVNC. This avoids the need for an X server that could be not compatible or throw errors (like XQuartz).

## Instructions
### amd64 Architecture
For amd64 architecture, first build the Docker image using the following command:
```bash
docker buildx build --platform linux/amd64 --tag teg57/xcrysden:1.6.2-web-amd64 -f dockerfile-amd --load .
```

Then run the Docker container with:
```bash
docker run --platform linux/amd64 --init --rm -p 6080:6080 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-web-amd64
```

### arm64 Architecture
For arm64 architecture, first build the Docker image using the following command:
```bash
docker buildx build --platform linux/arm64 --tag teg57/xcrysden:1.6.2-web-arm64 -f dockerfile-arm --load .
```

Then run the Docker container with:
```bash
docker run --platform linux/arm64 --init --rm -p 6080:6080 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-web-arm64
```

## Entering the web interface
Now to enter the web interface, open your browser and go to `http://localhost:6080/vnc.html`. There click on "Connect" and you will be able to use XCRYSDEN in your browser.

>[!TIP]
> If you close xcrysden, you can right click on the desktop, click Applications>Shells>Bash, then inside do `./xcrysden`, you can start it again. 

## Build image into one single image
To build the image into one single image, use the following command:
```bash
docker buildx build --platform linux/amd64 -f dockerfile-amd --platform linux/arm64 -f dockerfile-arm -t teg57/xcrysden:1.6.2-web --push .
```