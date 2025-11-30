#!/bin/bash

VALIDATE(){
    if [ $1 -ne 0 ] # taking last command status as first argument
    then
        echo "$2 ... FAILURE" # taking string in second argument
    else
        echo "$2 ... SUCCESS"
    fi
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already ... INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing git"
else
    echo "git is already ... INSTALLED"
fi