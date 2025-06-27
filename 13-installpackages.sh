#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
N="\e[0m"


if [ $ID -ne 0 ]
then
    echo -e " $R EEROR: PLEASE RUN THIS script with root access $N"
    exit 52 # it will stop here
else
    echo  -e " $G you are root user $N"
fi     #it was used to close the if statement 

echo "i want all the arguments passed :$@"


