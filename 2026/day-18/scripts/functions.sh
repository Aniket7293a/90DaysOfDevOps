#!/bin/bash

function greet()
{
        echo "Hello,$1"
}

function add()
{
        read -p "Enter number 1 :" NUM1
        read -p "Enter number 2 :" NUM2

        echo " toatal : $((NUM1+NUM2)) "
}

greet "Aniket"
add
