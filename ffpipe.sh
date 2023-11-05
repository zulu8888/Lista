#!/bin/bash
url=$1
auth="$(cat /home/authkey)"
ffmpeg  -loglevel fatal -user_agent "VAVOO/2.6" -re  -i "$url?n=1&b=5&vavoo_auth="$auth"=="  -vcodec copy -acodec copy -f mpegts pipe:1
exit 0
