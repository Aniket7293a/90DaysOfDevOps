#!/bin/bash 

function print_header()
{
        echo 
        echo "=========================================================="
        echo "          $1"
        echo "=========================================================="
}

function print_hostname()
{
        command hostnamectl | head -10
}

function print_uptime()
{
        command uptime
}

function print_disk_usage()
{
        df -h | sort -hrk5 | head -5  
}

function print_memory_usage()
{
        command free -h 
}

function print_process()
{
        ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
}

function main()
{
        print_header "hostname and os"
        print_hostname

        print_header " uptime"
        print_uptime

        print_header "Disk Usage"
        print_disk_usage

        print_header "memory usage"
        print_memory_usage

        print_header " Top 5 CPU consuming process" 
        print_process
}

main
