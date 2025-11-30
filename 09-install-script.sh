#!/bin/bash

USERID=$(id -u)

if [ $USERID -eq 0 ]
then
    dnf install mysql -y
else
    echo "ERROR:: you don't have access"
fi