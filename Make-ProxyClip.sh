#!/bin/bash

# Generate Proxy Clip
file="$1"
ffmpeg -i $file -vf scale=720:-2 -c:v h264_nvenc -preset 9 -rc 2 -b:v 1000k -c:a copy proxy_preset9.mp4