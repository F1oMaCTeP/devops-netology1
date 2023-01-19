#!/bin/bash
# display command line options

count=1
<<<<<<< HEAD
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    6039742 (merge: @ instead *)
    4f402d6 (merge: @ instead *)
=======

while [[ -n "$1" ]]; do
    echo "Parameter #$count = $1"
    3ff5e85 (merge: use shift)
>>>>>>> 9c4858a (Test)
    count=$(( $count + 1 ))
    shift
done
