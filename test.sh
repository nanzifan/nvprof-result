#!/bin/bash

name=$(date "+%H%M%S")

echo $name

logfolder="/home/znan/nvprof-result/"

subFolder=${PWD##*/}

echo $subFolder

newfolder="$logfolder$subfolder"

echo $newfolder

mkdir $newfolder

cp test.sh $newfolder


echo Done
