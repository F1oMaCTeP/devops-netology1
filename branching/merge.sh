#!/bin/bash
# display command line options

count=1
while [[ -n "$1" ]]; do
    echo "Parameter #$count = $1"
    868b981 (merge: use shift)
    count=$(( $count + 1 ))
    shift
done
