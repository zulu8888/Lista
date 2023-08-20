#!/bin/bash
url="http://www2.vavoo.to/live2/index"
curl -k "https://www2.vavoo.to/live2/index?countries=all&output=json" > vavoo
echo "#EXTM3U" > index
cat vavoo | sed 's/\(}\),/\1}\n,/g' | sed 's/"url":"/"url":\n/g' | sed 's#,{\"group\":#\#EXTINF:-1 group-title=#g' | sed 's#,\"logo\":\"\",\"name\":#,#g' | sed 's/\"}.*//' | sed 's/\",\"tvg.*//' | sed 's#\",\"#\",#g'  >> index 
cat index | sed "s#https://#pipe:///home/ffpipe.sh https://#g" > index.m3u
for country in Portugal Spain; do
cat index.m3u | grep -E -A1 =\"$country > $country.m3u
#m3u
echo "#EXTM3U" > /home/pipevavoo-$country.m3u
cat $country.m3u  >> /home/pipevavoo-$country.m3u
rm -rf $country.m3u
done
rm -rf index.m3u
rm index*
exit 0
