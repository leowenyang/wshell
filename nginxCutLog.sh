#! /bin/bash
# Author: leo
# Date & Time: 2016-12-21 17:49:12
# Description: cut nginx log file

ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ];then
  echo "Error: Must root run this program!"
  exit 1
fi
         
nginx_logs_dir="/home/wwwlogs/"
nginx_pid_file="/usr/local/nginx/logs/nginx.pid"
# cut file name, Ex : access_20141022.log
nginx_log_today="$nginx_logs_dir/access_`date +%Y%m%d`.log"

[ -f "$nginx_log_today" ] && exit 1
mv $nginx_logs_dir/access.log $nginx_log_today
# 给nginx发送USR1信号，使重新打开新的access.log日志文件
[ -f $nginx_pid_file ] && /bin/kill -USR1 $(cat $nginx_pid_file)

# set crontab：
#59 23 * * * /bin/bash /yourscriptpath/nginxCutLog.sh
