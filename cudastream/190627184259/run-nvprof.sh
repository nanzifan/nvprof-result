#!/bin/bash

logFolder="/home/znan/nvprof-result/"
subFolder=${PWD##*/}

newFolder="$logFolder$subFolder"

mkdir newFolder
echo "new folder" $newFolder

commands=(
	"--track-memory-allocations on"
	"--print-gpu-trace"
	"--cpu-thread-tracing on"
	"--cpu-profiling on"
	)

for i in "${commands[@]}"; do
	logName="$newFolder/$i.txt"
	/usr/local/cuda/bin/nvprof $i --log-file $logName $1 $2
	echo $i
done

echo 'Done'