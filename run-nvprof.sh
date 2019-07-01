#!/bin/bash

logFolder="/home/znan/nvprof-result/"
subFolder=${PWD##*/}

newFolder="$logFolder$subFolder"

mkdir $newFolder
echo "new folder" $newFolder

commands=(
	# CUDA options
	"profile-all-processes"
	"profile-api-trace all"
	"cpu-thread-tracing on"
	"track-memory-allocations on"
	"unified-memory-profiling per-process-device"
	# CPU options
	"cpu-profiling on"
	# print options
	"trace api, gpu"	
	"print-gpu-summary"
	"print-gpu-trace"
	)

for i in "${commands[@]}"; do
	echo $i
	filename=$(echo $i|cut -d' ' -f 1)
	logName="$newFolder/$filename.txt"
	/usr/local/cuda/bin/nvprof --$i --log-file $logName $1 $2	
done

echo 'Done'