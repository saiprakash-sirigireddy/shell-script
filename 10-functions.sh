#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
    if [ $1 -ne 0 ] # taking last command status as first argument
    then
        echo -e "$2 ... $R FAILURE" # taking string in second argument
    else
        echo -e "$2 ... $G SUCCESS"
    fi
}

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: You must have sudo access to execute this script"
    exit 1
fi

INSTALLED(){
    dnf list installed $1
    if [ $? -ne 0 ]
    then
        dnf install $1 -y
        VALIDATE $? "Installing $1"
    else
        echo -e "$1 is already ... $Y INSTALLED"
}

SOFTWARES=("mysql" "git")
INSTALLED ${SOFTWARES[0]}
INSTALLED ${SOFTWARES[1]}