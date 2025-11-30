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

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo -e "MySQL is already ... $Y INSTALLED"
fi

dnf list installed git

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? "Installing git"
else
    echo -e "git is already ... $Y INSTALLED"
fi