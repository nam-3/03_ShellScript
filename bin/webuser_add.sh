#!/bin/bash
#
# useradd -c EMAIL USERNAME
# echo $PASSWORD | passwd --stdin USERNAME
#

BASEDIR=/root/bin
USERDIR=$BASEDIR/users
USEROKDIR=$BASEDIR/users.completed

FILELIST=/tmp/tmp1

# 1) 파일 목록(~/bin/users/*.txt) 만들기
ls -1 $USERDIR/*.txt > $FILELIST

for FILE in $(cat $FILELIST)
do
    UNAME=$(cat $FILE | grep '^username:' | awk -F: '{print $2}')
    UPASS=$(cat $FILE | grep '^password:' | awk -F: '{print $2}')
    EMAIL=$(cat $FILE | grep '^email:'    | awk -F: '{print $2}')
    echo $UNAME $UPASS $EMAIL

    useradd -c "$EMAIL" "$UNAME" > /dev/null 2>&1
    if [ $? -eq 0 ] ; then 
        echo "[  OK  ] $UNAME 추가 완료!" 
        echo "$UPASS" | passwd --stdin "$UNAME" > /dev/null 2>&1
    else
        echo "[ FAIL ] $UNAME 추가 실패!"
        exit 2
    fi

    #cat $FILE
done



