#!/bin/bash

read -p "Enter file Name: " FileName

if [ -f $FileName ];
then
        echo "File exist"
else
        echo "File does not exist"
fi
