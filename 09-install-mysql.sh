#!/bin/bash


ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "EEROR: PLEASE RUN THIS script with root access"
else
    echo  " you are root user"
if

