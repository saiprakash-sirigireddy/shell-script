#!/bin/bash

USERID=$(id -u) # To get userid of current user

if [ $USERID -ne 0 ] # Only root user id is 0 ; other users id usually > 1000
then
    echo "ERROR:: You must have sudo access to execute this script"
    exit 1 # setting exit status as other than 0 if fails
fi

dnf installed list mysql # To check if mysql is already installed

if [ $? -ne 0 ] # last command exit stauts is not 0 means not installed
then
    dnf install mysql -y
    if [ $? -ne 0 ]
    then   
        echo "INSTALLING MySQL ... FAILURE"
        exit 1
    else
        echo "INSTALLING MySQL ... SUCCESS"
    fi
else
    echo "MySQL is already ... INSTALLED"
fi

dnf installed list git

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0 ]
    then   
        echo "INSTALLING git ... FAILURE"
        exit 1
    else
        echo "INSTALLING git ... SUCCESS"
    fi
else
    echo "git is already ... INSTALLED"
fi