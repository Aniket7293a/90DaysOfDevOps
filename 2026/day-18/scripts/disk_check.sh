#!/bin/bash

function check_disk()
{
        echo "Disk usage: "
        df -h /
}

function check_memory()
{
        echo
        echo "Memory usage"
        free -h
}

check_disk
check_memory
