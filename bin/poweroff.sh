#!/bin/bash

SERVERLIST=/root/bin/server.list
cat << EOF > $SERVERLIST
server1
server2
EOF

#cat $SERVERLIST | while read SERVER   -> ssh 사용시 파이프 쓰면 버그 발생
for host in $(cat $SERVERLIST)
do
    ssh $host poweroff
    sleep 3
done
sleep 2

poweroff
sleep 2

