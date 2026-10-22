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
