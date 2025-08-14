#!/bin/bash

echo -n "Enter A : "
read A

echo -n "Operator: "
read OP

echo -n "Enter B : "
read B

case $OP in
    '+') echo "$A $OP $B =  $(expr $A + $B)" ;;
    '-') echo $A $OP $B "=" $(expr $A - $B) ;;
    'x') echo $A $OP $B "=" $(expr $A \* $B) ;;
    '/') echo $A $OP $B "=" $(expr $A / $B) ;;
    '%') echo $A $OP $B "=" $(expr $A % $B) ;;
    *) echo "[  FAIL  ] 잘못된 연산자를 입력하였습니다. : $OP "
        exit 1
    ;;
esac

