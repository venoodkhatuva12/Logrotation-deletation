#!/bin/bash
#Script made for log deletion
#Author: Vinod.N K
#Usage: logs deletation of application or software
#Distro : Linux -Centos, Rhel, and any fedora
#Check whether root user is running the script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi
#Catilina.log check

SERVERNAME='/tomcat7/logs/'


if [ -a $SERVERNAME/Catilina.log ];

then # file exists

    FILE1=$(du -ks $SERVERNAME/Catilina.log | awk '{print $1}') # get file size in K



    if [ $FILE1 -ge 2097152 ]; # file size is greater than or equal to 2 GB

    then 
        cat /dev/null > $SERVERNAME/Catilina.log

    elif [ $FILE1 -ge 1048576 ]; # file size is greater than 1 GB

    then # echo and send mail to admin
        echo "File size has exceeded 1 GB" | mail -s " Name of Server  /path/of/server/ " admin@domain.com -c admin2@domain.com

    fi



else # file does not exist

    echo "Catilina.log not found"

fi
