#!/bin/bash

read -p "Enter any number: " NUM

if [ $NUM -gt 0 ];
then
        echo " POSITIVE"
elif [ $NUM -lt 0 ];
then
        echo " NEGATIVE"
else
        echo "ZERO"
fi
