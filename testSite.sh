#! /bin/bash
# Author: leo
# Date & Time: 2016-11-10 14:10:08
# Description: 


if [ $# -lt 2 ]; then 
cat << EOF
Usage : testSite.sh [time] [site]
        testSite.sh 3 www.baidu.com
EOF

exit
fi

curl_result_format=\
"============================\n\
time_namelookup: %{time_namelookup}\n\
time_connect: %{time_connect}\n\
time_appconnect: %{time_appconnect}\n\
time_redirect: %{time_redirect}\n\
time_pretransfer: %{time_pretransfer}\n\
time_starttransfer: %{time_starttransfer}\n\
----------\n\
time_total: %{time_total}\n\
time_size_download: %{size_download}\n\
time_speed_dowload: %{speed_download}\n\
===========================\n"

for ((i=1; i<=$1; i++)); do
  curl -lw "$curl_result_format" -H "Accept-Encoding: gzip,deflate" $2 -o /dev/null;
done
