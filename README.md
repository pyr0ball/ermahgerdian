Pest Paladin
===============

Software for Raspberry Pi "Pest Paladin" project using AT&T M2X and Flow.

### To run web server:

<code>
cd web
../hls/start_server.sh
</code>


### To run RTSP to HLS converter:

<code>
cd hls
./start_stream.sh
</code>

### To test video input:

<code>
./take_frame.sh
</code>

### To run object recognition:

<code>
./OpenCV-ffmpg-example.py
</code>

### Notes
* The web camera and AT&T services require unique credentials and configuration.
