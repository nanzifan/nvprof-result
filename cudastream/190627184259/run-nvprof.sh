#!/bin/bash

logFolder="/home/znan/nvprof-result/"
subFolder=${PWD##*/}

newFolder="$logFolder$subFolder"

mkdir $newFolder
echo "new folder" $newFolder

commands=(
	"track-memory-allocations on"
	# "print-gpu-trace"
	"cpu-thread-tracing on"
	"cpu-profiling on"
	"print-gpu-trace --track-memory-allocations on"
	)

for i in "${commands[@]}"; do
	echo $i
	filename=$(echo $i|cut -d' ' -f 1)
	logName="$newFolder/$filename.txt"
	/usr/local/cuda/bin/nvprof --$i --log-file $logName $1 $2	
done

echo 'Done'