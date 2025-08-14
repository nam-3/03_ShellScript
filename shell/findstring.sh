#!/bin/bash

if [ $# -ne 2 ] ; then
    echo "Usage : $0 <pattern> <filename>"
    exit 1
fi

PATTERN=$1
FILENAME=$2

#echo $1 "-" $2

# -q : grep $1 $2 > /dev/null 2>&1
grep -q "$PATTERN" "$FILENAME"
if [ $? -eq 0 ] ; then
    echo "[  OK  ] $FILENAME 파일에서 $PATTERN 을 찾았습니다."
else
    echo "[  FAIL  ] $FILENAME 파일에서 $PATTERN 을 못 찾았습니다. "
fi

