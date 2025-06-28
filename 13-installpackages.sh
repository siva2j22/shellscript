#!/bin/bash

ID=$(id -u)

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
G="\e[33m"
N="\e[0m"

echo "script start time $TIMESTAMP"  &>>LOGFILE

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$2 .. $R FAILED $N"
    else
        echo -e "$2 .. $G success $N"
    fi

}


if [ $ID -ne 0 ]
then
    echo -e " $R EEROR: PLEASE RUN THIS script with root access $N"
    exit 52 # it will stop here
else
    echo  -e " $G you are root user $N"
fi     #it was used to close the if statement 

#echo "i want all the arguments passed :  $@"
#git maven .net

for package in $@  # package = git maven .net 
do
    yum list installed $package  &>>LOGFILE # cheack install package or not
    if [ $? -ne 0 ]# in if not installed
    then
        yum install $package -y &>>LOGFILE # install the package
        VALIDATE $? "Installation of $package"  # validate the 
    else
        echo -e "$package is already install .. $Y skkiping $N"
    fi
done

 


