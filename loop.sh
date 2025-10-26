#!/bin/bash
# ============================================================
#  YouTube 24/7 Loop Stream Script
#  by ElectroSpark-Pragatheesh ⚡thhgb
# ============================================================

# 🔹 1. Your video file link (Google Drive direct download link)
# Replace the ID with yours if you ever change the video.
VIDEO="https://drive.google.com/uc?export=download&id=1pXCkxS92ZeJORx77cKgMQFnaR_C8dAw_"

# 🔹 2. Your YouTube Stream Key (keep it private!)
# You can find it in YouTube Studio → Go Live → Stream Settings.
STREAM_KEY=$STREAM_KEY


# ============================================================
#  Don't edit below unless you know what you're doing
# ============================================================

echo "🎬 Starting 24/7 YouTube Live Stream..."
echo "Using video source: $VIDEO"
echo "Using stream key: $STREAM_KEY"
echo "------------------------------------------"

# Infinite loop to keep the stream running forever
while true; do
  ffmpeg -re -stream_loop -1 -i "$VIDEO" \
    -c:v libx264 -preset veryfast -maxrate 2500k -bufsize 5000k \
    -vf scale=1280:720 -c:a aac -b:a 128k -ar 44100 \
    -f flv "rtmp://a.rtmp.youtube.com/live2/$STREAM_KEY"

  echo "⚠️ Stream ended or crashed — restarting in 5 seconds..."
  sleep 5
done
