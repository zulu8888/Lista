#!/bin/bash
curl -k "https://www2.vavoo.to/live2/index?countries=all&output=json" > vavoo
echo "#EXTM3U" > index
cat vavoo | sed 's/\(}\),/\1}\n,/g' | sed 's/"url":"/"url":\n/g' | sed 's#,{\"group\":#\#EXTINF:-1 group-title=#g' | sed 's#,\"logo\":\"\",\"name\":#,#g' | sed 's/\"}.//' | sed 's/\",\"tvg.//' | sed 's#\",\"#\",#g' >> index
mv index index.m3u
cat index.m3u | sed "s#http://#pipe:///volume1/@appdata/tvheadend/ffpipe.sh http://#g" > index2.m3u
for country in Spain; do
cat index2.m3u | grep -E -A1 =\"$country > $country.m3u
#m3u
echo "#EXTM3U" > /volume1/web/vavoo-$country.m3u
cat $country.m3u >> /volume1/web/vavoo-$country.m3u
done
rm index*
rm vavoo
exit 0
