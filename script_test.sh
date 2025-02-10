#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage : $0 <URL>"
    exit 1
fi

URL="$1"

echo "Lancement des tests de charge sur : $URL"

tests=(
    "10 3"
    "20 8"
    "40 12"
    "60 20"
)


for test in "${tests[@]}"; do
    read total_requests concurrent <<< "$test"
    
    echo "-------------------------------------------------"
    echo "Test : $total_requests requêtes avec $concurrent connexions simultanées"
    echo "-------------------------------------------------"

    ab -n "$total_requests" -c "$concurrent" "$URL"
    
    echo
done

echo "Tests terminés."
