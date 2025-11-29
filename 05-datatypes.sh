#!/bin/bash

NUMBER1=$1
NUMBER2=$2

TIMESTAMP=$(date) # execute command inside brackets and 
#$() represents store that output to left variable
echo "Script executed at : $TIMESTAMP"

SUM=$(($NUMBER1+$NUMBER2))