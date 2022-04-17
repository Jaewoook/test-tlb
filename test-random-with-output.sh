#!/bin/bash
OUTPUT_FILENAME=result-$(TZ='Asia/Seoul' date -Iminutes).csv
STRIDE=$1

if [ $# -eq 0 ]
then
    STRIDE=64
fi

echo "Starting test-tlb with stride=$STRIDE"
echo ""

echo "Size,Access Time,Cycles" >> $OUTPUT_FILENAME
for i in 4k 8k 16k 32k 64k 128k 256k 512k 1M 2M 4M 6M 8M 16M 32M 64M 128M 256M
do
    echo "./test-tlb -r $i $STRIDE"
    echo -n "$i," >> $OUTPUT_FILENAME
    ./test-tlb -r $i $STRIDE >> $OUTPUT_FILENAME
done
