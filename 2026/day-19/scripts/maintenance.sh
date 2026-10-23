#!/bin/bash

set -euo pipefail

LOG_FILE="/var/log/maintenance.log"

function log_rotation()
{
        /home/ubuntu/scripts/log_rotate.sh \
                /home/ubuntu/data >> "$LOG_FILE" 2>&1
}

function backup()
{
            /home/ubuntu/scripts/backup.sh \
                            /home/ubuntu/data \
                                    /home/ubuntu/backups >> "$LOG_FILE" 2>&1
}

function main()
{
        echo " " >> "$LOG_FILE"
        echo "$(date) : starting Maintenance... " >> "$LOG_FILE"

        log_rotation
        backup

        echo "Maintenance Completed for today" >> "$LOG_FILE" 
}

main

echo "Successfully written logs to $LOG_FILE"
sudo cat /var/log/maintenance.log 
