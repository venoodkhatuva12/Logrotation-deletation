#!/bin/bash

#Catilina.log check

SERVERNAME='/tomcat7/logs/'


if [ -a $SERVERNAME/Catilina.log ];

then # file exists

    FILE1=$(du -ks $AIEP/moofwd-rt.log | awk '{print $1}') # get file size in K



    if [ $FILE1 -ge 2097152 ]; # file size is greater than or equal to 2 GB

    then # delete

        #echo "File size >= 2 GB, deleting file"

        cat /dev/null > $SERVERNAME/Catilina.log



    elif [ $FILE1 -ge 1048576 ]; # file size is greater than 1 GB

    then # send mail

        echo "File size has exceeded 1 GB" | mail -s " Name of Server  /path/of/server/ " admin@domain.com -c admin2@domain.com

   # else # file size did not reach 1 GB

   # echo "File size is under 1 GB"

    fi



else # file does not exist

    echo "Catilina.log not found"

fi
