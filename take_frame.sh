#!/bin/bash

echo "Taking picture"
#ffmpeg -i /dev/video0 -r 1 cam%4d.jpg # consecutive frames
ffmpeg -i /dev/video0 -t 1 -r 1 cam%4d.jpg # 1frame

