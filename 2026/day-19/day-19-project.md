# Day 19 - Shell Scripting Project: Log Rotation, Backup & Crontab

## Objective

Apply shell scripting concepts learned in previous days by creating practical automation scripts/ mini projects for log rotation, backups, and scheduled maintenance.

---

# Task 1: Log Rotation Script

## Requirements

* Accept a log directory as an argument.
* Compress `.log` files older than 7 days.
* Delete `.gz` files older than 30 days.
* Display the number of files compressed and deleted.
* Exit with an error if the directory does not exist.

## Script: `log_rotate.sh`

```bash
#!/bin/bash

set -euo pipefail

function print_usage()
{
        echo "usage: ./log_rotate.sh /var/log/myapp "
}

if [ $# -eq 0 ];
then
        print_usage
fi

dir=$1

function check_dir()
{
 if [ !  -d "$dir" ];
 then
        echo "Directory  does't exist"
        exit 1
 fi
}

gzip_count=0
delete_count=0

function compress()
{
        file_list=$( find "$dir" -type f -name "*.log" -mtime +1 )

        for file in $file_list;
        do
                gzip "$file"
                gzip_count=$((gzip_count+1))
        done
}

function delete_log()
{
        file_list=$( find "$dir" -type f -name "*.gz" -mtime +30 )

        for file in $file_list;
        do
                rm "$file"
                delete_count=$((delete_count+1))
        done
}



check_dir
compress
delete_log


echo "Total log files zipped : $gzip_count"
echo "Total zip files deleted : $delete_count"
```

### Sample Output

```text
Total log files zipped : 5
Total zip files deleted : 2
```

---

# Task 2: Server Backup Script

## Requirements

* Accept source and destination directories as arguments.
* Create a timestamped `.tar.gz` archive.
* Verify backup creation.
* Display archive name and size.
* Delete backups older than 14 days.
* Exit with an error if the source directory does not exist.

## Script: `backup.sh`

```bash
#!/bin/bash

set -euo pipefail

function print_usage()
{
        echo "usage:./backup.sh <path_to_source> <path_to_destination>"
        exit 1
}

 if [ $# -eq 0 ];
 then
         print_usage
 fi

 timestamp=$(date '+%y-%m-%d-%H-%M-%S')
 source_dir=$1
 backup_dir=$2
 archive="backup_${timestamp}.tar.gz"

 function create_backup()
 {
        tar -czf  "$backup_dir/$archive" "$source_dir"
        echo "======Backup started======"
        echo " Backup Complete !"
 }

 function print_details()
 {
         echo "======Backup Completed======"
         echo " Archive Name: $archive "
 }

 function delete_backup()
 {
         file_list=$(find "$backup_dir" -type f -name "*.gz" -mtime +14)
         if [ -n "$file_list" ];
         then

          for file in $file_list;
          do
                  rm "$file"
          done

          echo "======Removing archives older than 14 days======"
         fi
 }

create_backup
print_details
delete_backup
```

### Sample Output

```text
======Backup started======
 Backup Complete !
======Backup Completed======
 Archive Name: backup_26-10-23-11-05-33.tar.gz
```

---

# Task 3: Cron Jobs

## Check Existing Cron Jobs

```bash
crontab -l
```

## Edit Cron Jobs

```bash
crontab -e
```

## Cron Syntax

```text
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week (0-7)
│ │ │ └──── Month (1-12)
│ │ └────── Day of month (1-31)
│ └──────── Hour (0-23)
└────────── Minute (0-59)
```

## Daily Log Rotation at 2 AM

```cron
0 2 * * * /home/ubuntu/scripts/log_rotate.sh /home/ubuntu/data
```

## Weekly Backup Every Sunday at 3 AM

```cron
0 3 * * 0 /home/ubuntu/scripts/backup.sh /home/ubuntu/data /home/ubuntu/backups
```

## Health Check Every 5 Minutes

```cron
*/5 * * * * /home/ubuntu/health_check.sh
```

---

# Task 4: Scheduled Maintenance Script

## Requirements

* Execute log rotation.
* Execute backup.
* Store output in `/var/log/maintenance.log`.
* Include timestamps.

## Script: `maintenance.sh`

```bash
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
```

### Sample Log Output

```text
Successfully written logs to /var/log/maintenance.log

Fri Oct 23 11:11:15 UTC 2026 : starting Maintenance...
Total log files zipped : 0
total zip files deleted : 0
tar: Removing leading `/' from member names
======Backup started======
 Backup Complete !
======Backup Completed======
 Archive Name: backup_26-10-23-11-11-16.tar.gz
Maintenance Completed for today

```

## Cron Entry

```cron
0 1 * * * /home/ubuntu/scripts/maintenance.sh
```

---

# Key Concepts Learned

### 1. Log Rotation

Used `find`, `gzip`, and file-age filters (`-mtime` for days and `-mmin` for minutes) to automate log management, compress older files, and reduce disk usage.

### 2. Automated Backups

Created compressed archives using `tar`, verified successful creation, and removed outdated backups automatically.

### 3. Task Scheduling with Crontab

Learned how to automate script execution using cron jobs for daily, weekly, and recurring maintenance tasks.

---

# Commands Used

```bash
find
gzip
rm
tar
mmin
mtime
date
cron
crontab
``


