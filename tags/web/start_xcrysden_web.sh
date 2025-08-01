#!/bin/bash

# WARNING: Running without a password is a severe security risk.
# ONLY for local testing in a secure environment.
# DO NOT expose port 5900 or 6080 to the internet if running without a password.

# Internal VNC display and port
VNC_DISPLAY=:0
VNC_PORT=5900

# WebSockets/noVNC port
WEBSOCKIFY_PORT=6080

# Start Xvfb (virtual framebuffer)
Xvfb $VNC_DISPLAY -screen 0 1024x768x24 &
export DISPLAY=$VNC_DISPLAY

# Start a lightweight window manager (e.g., Fluxbox)
fluxbox &

# Start x11vnc server without a password
# Ensure it listens on the VNC_PORT
x11vnc -forever -nopw -display $DISPLAY -rfbport $VNC_PORT -noxrecord -noxfixes -noxdamage &

# Wait a moment for X and VNC to initialize
sleep 2

# Start websockify using python3 explicitly
# The --web option now points to the downloaded noVNC directory.
python3 -m websockify --web /opt/noVNC $WEBSOCKIFY_PORT localhost:$VNC_PORT &

# Run xcrysden in a way that keeps the container alive
xterm -e "/app/xcrysden-1.6.2-bin-shared/xcrysden" &

echo "*****************************************************"
echo "  XCRYSDEN is running! Access it at:"
echo "  http://localhost:${WEBSOCKIFY_PORT}/vnc.html"
echo "*****************************************************"

# Keep the script running
exec tail -f /dev/null