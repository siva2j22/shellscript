#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "timestamp is":$TIMESTAMP

echo "script name :$0"

R="\e[31m"
G="\e[32m"
N="\e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "ERROR:: $2 is $R failed $N"
        exit 25
    else
        echo -e " installed software $2 $G success $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e " $R EEROR: PLEASE RUN THIS script with root access $N"
    exit 52 # it will stop here
else
    echo  -e " $G you are root user $N"
fi     #it was used to close the if statement 


yum install mysql -y &>> $LOGFILE

VALIDATE $? "installed mysql" 

yum install git -y &>> $LOGFILE

VALIDATE $? "INSTALLING GIT"