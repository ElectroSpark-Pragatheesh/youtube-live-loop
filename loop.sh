#!/bin/bash
VIDEO="loopvideo.mp4"
STREAM_KEY="xzyz-emt8-9880-wzrd-9ed5"

while true; do
  ffmpeg -re -stream_loop -1 -i "$VIDEO" \
  -c:v libx264 -preset veryfast -maxrate 2500k -bufsize 5000k \
  -vf scale=1280:720 -c:a aac -b:a 128k -ar 44100 \
  -f flv "rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY"
  echo "Restarting stream in 5s..."
  sleep 5
done
