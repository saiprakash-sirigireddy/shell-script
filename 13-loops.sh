#!/bin/bash

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | awk -F'.' '{print $1}')
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ] # taking last command status as first argument
    then
        echo -e "$2 ... $R FAILURE $N"  # taking string in second argument
    else
        echo -e "$2 ... $G SUCCESS $N" 
    fi
}

echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: You must have sudo access to execute this script $N" &>>$LOG_FILE_NAME
    exit 1
fi

for package in $@
do 
    dnf list installed $package &>>$LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y ... INSTALLED $N"
    fi
done 