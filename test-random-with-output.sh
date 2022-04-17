#!/bin/bash
OUTPUT_FILENAME=result-$(TZ='Asia/Seoul' date -Iminutes).csv

echo "Starting test-tlb"
echo ""

echo "Size,Access Time,Cycles" >> $OUTPUT_FILENAME
for i in 4k 8k 16k 32k 64k 128k 256k 512k 1M 2M 4M 6M 8M 16M 32M 64M 128M 256M
do
    echo "./test-tlb -r $i 64"
    echo -n "$i," >> $OUTPUT_FILENAME
    ./test-tlb -r $i 64 >> $OUTPUT_FILENAME
done
