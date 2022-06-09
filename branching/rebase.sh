#!/bin/bash
# display command line options

count=1
for param in "$@"; do
<<<<<<< HEAD
    echo "Next parameter: $param"
=======
    echo "\$@ Parameter #$count = $param"
>>>>>>> 0a57ed0dd14abaed9f9b899eb507481bd33b47bf
    count=$(( $count + 1 ))
done

echo "====="
