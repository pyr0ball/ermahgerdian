#!/bin/bash

echo "Starting stream"
ffmpeg -v info -rtsp_transport tcp -i rtsp://pi:raspberry@ipcam:88/videoMain -c:v copy -c:a aac -hls_time 0.1 -hls_wrap 4 -start_number 1 test.m3u8
echo "Stream ended"


