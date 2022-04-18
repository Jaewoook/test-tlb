#!/bin/bash
STRIDE=$1
MAP="4k 8k 16k 32k 64k 128k 256k 512k 1M 2M 4M 6M 8M 16M 32M 64M 128M 256M"

if [ $# -eq 0 ]
then
    STRIDE="4 8 16 32 64 128 256 512 1024 2048 4096"
fi


echo "Starting test-tlb"
echo "Target map sizes: $MAP"
echo "Target strides: $STRIDE"

for stride in $STRIDE
do
    OUTPUT_FILENAME="result-stride-$stride.csv"
    echo -e "\nstride: $stride"
    echo "Size,Access Time,Cycles" >> $OUTPUT_FILENAME

    for map in $MAP
    do
        echo -n "$map," >> $OUTPUT_FILENAME
        echo "./test-tlb -r $map $stride"
        ./test-tlb -r $map $stride >> $OUTPUT_FILENAME
    done

    echo -e "\nInfo: MAP=$MAP STRIDE=$STRIDE" >> $OUTPUT_FILENAME
done

echo "Done"