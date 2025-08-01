# Dockerfile for XCRYSDEN 1.6.2 with Web Interface

This Dockerfile sets up an environment for running XCRYSDEN 1.6.2 with a web interface using noVNC. This avoids the need for an X server that could be not compatible or throw errors (like XQuartz).

## Instructions
To build the Docker image, run
```bash
docker build -t teg57/xcrysden:1.6.2-web .
```

To run the Docker container, use
```bash
docker run --init --rm -p 6080:6080 -v "$env:USERPROFILE\Documents\xcrysden:/mnt/data" teg57/xcrysden:1.6.2-web
```

Now to enter the web interface, open your browser and go to `http://localhost:6080/vnc.html`. There click on "Connect" and you will be able to use XCRYSDEN in your browser.

>[!TIP]
> If you close xcrysden, you can right click on the desktop, click Applications>Shells>Bash, then inside do `./xcrysden`, you can start it again. 
