#!/bin/bash
# display command line options

count=1
while [[ -n "$1" ]]; do
    echo "Parameter #$count = $1"
<<<<<<< HEAD
    868b981 (merge: use shift)
=======
>>>>>>> 0a57ed0dd14abaed9f9b899eb507481bd33b47bf
    count=$(( $count + 1 ))
    shift
done
