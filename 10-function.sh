#!/bin/bash

ID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo "ERROR:: $2 is failed"
        exit 25
    else
        echo " installed software $2 success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "EEROR: PLEASE RUN THIS script with root access"
    exit 52 # it will stop here
else
    echo  " you are root user"
fi     #it was used to close the if statement 


yum install mysql -y 

VALIDATE $? "installed mysql" 

yum install git -y

VALIDATE $? "INSTALLING GIT"