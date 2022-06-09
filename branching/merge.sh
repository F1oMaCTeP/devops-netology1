#!/bin/bash
# display command line options

count=1
for param in "$@"; do
    echo "\$@ Parameter #$count = $param"
    6039742 (merge: @ instead *)
    4f402d6 (merge: @ instead *)
    count=$(( $count + 1 ))
    shift
done
