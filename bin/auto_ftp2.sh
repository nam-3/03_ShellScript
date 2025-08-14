#!/bin/bash

IPFILE=/root/shell/server.txt

cat $IPFILE | while read UIP
do
    ftp -n $UIP << EOF
user root soldesk1.
cd /tmp
lcd /test
bin
hash
prompt
mput linux202.txt
quit
EOF
done

