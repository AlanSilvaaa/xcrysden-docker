# Dockerfile for XCRYSDEN 1.6.2 with Web Interface

This Dockerfile sets up an environment for running XCRYSDEN 1.6.2 with a web interface using noVNC. This avoids the need for an X server that could be not compatible or throw errors (like XQuartz).

>[!IMPORTANT]
> When you ran the image, it will appear a lot of errors or missing libraries, this is normal, just ignore them. The important part is when it says `XCRYSDEN is running! Access it at:`.

## Pull and Run from DockerHub

You can run the pre-built image directly from DockerHub without building it locally. This will download the image if you don't have it already and run it:

### amd64 Architecture
```bash
docker run --platform linux/amd64 --init --rm -p 6080:6080 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-web
```

### arm64 Architecture
```bash
docker run --platform linux/arm64 --init --rm -p 6080:6080 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-web
```

## Build and Run Locally
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
Now to enter the web interface, open your browser and go to `http://localhost:6080/vnc.html`. There click on "Connect" and you will be able to use XCrySDen in your browser.

>[!TIP]
> If you close XCrySDen, you can right click on the desktop, click Applications>Shells>Bash, then inside do `./xcrysden`, you can start it again.

## Build image into one single image
To build the image into one single image, use the following command:

```bash
docker buildx build --platform linux/amd64 -f dockerfile-amd  -t teg57/xcrysden:1.6.2-web-amd64  --push .
docker buildx build --platform linux/arm64 -f dockerfile-arm  -t teg57/xcrysden:1.6.2-web-arm64  --push .

docker buildx imagetools create -t teg57/xcrysden:1.6.2-web teg57/xcrysden:1.6.2-web-amd64 teg57/xcrysden:1.6.2-web-arm64
```