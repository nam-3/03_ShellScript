#!/bin/bash

echo -n "yes/no를 입력하시오(yes/no) : "
read YESNO

case $YESNO in
    yes | Y | y | YES | Yes ) echo "[ INFO ] YESMAN" ;;
    no  | N | n | NO  | No  ) echo "[ INFO ] NOMAN " ;;
    * ) echo "[ FAIL ] 잘못된 입력입니다."
    exit 1 ;;
esac