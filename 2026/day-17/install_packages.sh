#!/bin/bash

#list of packages
PACKAGES="nginx curl wget"

#Check each package
for PACKAGE in $PACKAGES
do
        echo "Checking package: $PACKAGE"

        if dpkg -s "$PACKAGE" &> /dev/null
        then
                echo " $PACKAGE is already installed. Skipping...."
        else
                echo " $PACKAGE is missing. Installing..."

                apt install -y "$PACKAGE"

                if dpkg -s "$PACKAGE" &> /dev/null
                then
                        echo "$PACKAGE installed successfully.."
                else
                        echo "Failed to install $PACKAGE. "
                fi
        fi
    echo " ----------------------------------------"
done
