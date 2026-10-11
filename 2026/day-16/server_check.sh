#!/bin/bash

service="nginx"

echo "Do you want to check the status? (y/n)"
read choice

if [ "$choice" = "y" ];
then
    systemctl status "$service"

      if [ $? -eq 0 ]; then
           echo "$service is active."
      else
         echo "$service is not active."
      fi

elif [ "$choice" = "n" ]; then
    echo "Skipped."

else
    echo "Invalid choice."
fi
