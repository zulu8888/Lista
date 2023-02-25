#!/bin/bash
url="http://www2.vavoo.to/live2/index"
wget -q --no-check-certificate $url 
cat index | sed "s#http://#pipe:///home/ffpipe.sh http://#g" > index.m3u
for country in Benfica; do
cat index.m3u | grep -E -A1 =\"$country > $country.m3u

#m3u
echo "#EXTM3U" > /home/pipevavoo-$country.m3u
cat $country.m3u  >> /home/pipevavoo-$country.m3u
rm -rf $country.m3u
done
rm -rf index.m3u
rm index*
exit 0


