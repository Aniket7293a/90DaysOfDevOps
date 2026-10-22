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
echo "total zip files deleted : $delete_count"
