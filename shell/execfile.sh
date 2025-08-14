#!/bin/bash

echo -n "Enter Your Filename : "
read FILENAME

# echo $FILENAME
echo
if [ -x "$FILENAME" ] ; then
    $FILENAME
fi 

