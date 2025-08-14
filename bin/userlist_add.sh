#!/bin/bash

USERLIST=/root/bin/user.list
# 내용 비우기
> $USERLIST

for i in $(seq 1 50)
do
    echo "user$i  user$i" >> $USERLIST
done

