#!/bin/bash

demo_local() {
    local NAME="Aniket"
    echo "Inside function: $NAME"
}

demo_global() {
    CITY="Indore"
    echo "Inside function: $CITY"
}

demo_local

echo "Outside function local variable: ${NAME:-Not Available}"

demo_global

echo "Outside function global variable: $CITY"
