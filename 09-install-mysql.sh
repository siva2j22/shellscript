#!/bin/bash


ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "EEROR: PLEASE RUN THIS script with root access"
    exit 52 # it will stop here
else
    echo  " you are root user"
fi     #it was used to close the if statement 

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: installing mysql is failed"
    exit 25
else
    echo " installed mysql is success"
fi

yum install git -y

if [ $? -ne 0 ]
then
    echo "ERROR::: INSTALL GIT ISSUE"
    exit 53
else
    echo "install git software succesfully"
fi

